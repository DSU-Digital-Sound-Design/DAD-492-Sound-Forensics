writeInfoLine: "Extracting formants..."

# Extract the names of the Praat objects
thisSound$ = "ALL_050_M_ENG_ENG_ST1"
thisTextGrid$ = "ALL_050_M_ENG_ENG_ST1"

tierNumber = 3 

# Extract the number of intervals in the phoneme tier
select TextGrid 'thisTextGrid$'
numberOfPhonemes = Get number of intervals: tierNumber

# Create the Formant Object
select Sound 'thisSound$'
To Pitch: 0.001, 75, 300
Rename: "pitch"

select Sound 'thisSound$'
To Formant (burg)... 0 5 5000 0.025 50
Rename: "formant"

# Create the output file and write the first line.
outputPath$ = "/Users/tatecarson/Downloads/formants-ALL_050_M_ENG_ENG_ST1.csv"
writeFileLine: "'outputPath$'", "speaker,vowel,duration,time,F0,F1,F2,F3"

# Loop through each interval on the phoneme tier.

for thisInterval from 1 to numberOfPhonemes
    #appendInfoLine: thisInterval

    # Get the label of the interval
    select TextGrid 'thisTextGrid$'
    thisPhoneme$ = Get label of interval: tierNumber, thisInterval

    # Print if not blank, longer than 2 characters and exclude sil and spn
    # This is a hack so that we only see the vowels

    if thisPhoneme$ <> "" &&  length(thisPhoneme$) > 2 && thisPhoneme$ <> "sil" && thisPhoneme$ <> "spn"        

        # Replace Arpabet with IPA
        thisPhoneme$ = replace_regex$(thisPhoneme$, "AA[0-9]*", "ɑ", 0)
        thisPhoneme$ = replace_regex$(thisPhoneme$, "AE[0-9]*", "æ", 0)
        thisPhoneme$ = replace_regex$(thisPhoneme$, "AH[0-9]*", "ʌ", 0)
        thisPhoneme$ = replace_regex$(thisPhoneme$, "AO[0-9]*", "ɔ", 0)
        thisPhoneme$ = replace_regex$(thisPhoneme$, "AW[0-9]*", "aʊ", 0)
        thisPhoneme$ = replace_regex$(thisPhoneme$, "AX[0-9]*", "ə", 0)
        thisPhoneme$ = replace_regex$(thisPhoneme$, "AXR[0-9]*", "ɚ", 0)
        thisPhoneme$ = replace_regex$(thisPhoneme$, "AY[0-9]*", "aɪ", 0)
        thisPhoneme$ = replace_regex$(thisPhoneme$, "EH[0-9]*", "ɛ", 0)
        thisPhoneme$ = replace_regex$(thisPhoneme$, "ER[0-9]*", "ɝ", 0)
        thisPhoneme$ = replace_regex$(thisPhoneme$, "EY[0-9]*", "eɪ", 0)
        thisPhoneme$ = replace_regex$(thisPhoneme$, "IH[0-9]*", "ɪ", 0)
        thisPhoneme$ = replace_regex$(thisPhoneme$, "IX[0-9]*", "ɨ", 0)
        thisPhoneme$ = replace_regex$(thisPhoneme$, "IY[0-9]*", "i", 0)
        thisPhoneme$ = replace_regex$(thisPhoneme$, "OW[0-9]*", "oʊ", 0)
        thisPhoneme$ = replace_regex$(thisPhoneme$, "OY[0-9]*", "ɔɪ", 0)
        thisPhoneme$ = replace_regex$(thisPhoneme$, "UH[0-9]*", "ʊ", 0)
        thisPhoneme$ = replace_regex$(thisPhoneme$, "UW[0-9]*", "u", 0)
        thisPhoneme$ = replace_regex$(thisPhoneme$, "UX[0-9]*", "ʉ", 0)

        # Find the midpoint.
        thisPhonemeStartTime = Get start point: tierNumber, thisInterval
        thisPhonemeEndTime   = Get end point:   tierNumber, thisInterval
        duration = thisPhonemeEndTime - thisPhonemeStartTime
        midpoint = thisPhonemeStartTime + duration/2

        # extract pitch 
        selectObject: "Pitch pitch"
        pitch = Get value at time: midpoint, "Hertz", "linear"

        # Extract formant measurements
        selectObject: "Formant formant"
        f1 = Get value at time... 1 midpoint Hertz Linear
        f2 = Get value at time... 2 midpoint Hertz Linear
        f3 = Get value at time... 3 midpoint Hertz Linear

        # Save to a spreadsheet
        appendFileLine: "'outputPath$'", 
                        ..."A", ",",
                        ...thisPhoneme$, ",",
                        ...duration, ",",
                        ...midpoint, ",",
                        ...pitch, ",",
                        ...f1, ",", 
                        ...f2, ",", 
                        ...f3
    endif
endfor

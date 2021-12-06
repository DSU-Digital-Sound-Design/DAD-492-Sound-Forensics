## Run from terminal with:
## /Applications/Praat.app/Contents/MacOS/Praat --run "list-files.praat"

# This script runs through a folder of TextGrid and wav files, extracts the formants and produces a CSV 
# that is formatted for use with visiblevowels.org 

# Need to add the ability to add demographic information to the CSV file

directory_name$ = "/Users/tatecarson/Downloads/ALL_ENG_ENG_ST1" 
labeled_tier_number = 3

Create Strings as file list... list 'directory_name$'/*.wav

num = Get number of strings

# Create one header for all textgrids
# think i only need to do this once 
outputPath$ = "/Users/tatecarson/Quartz Gardens/DAD-492-Sound-Forensics/content/pages/lectures/week-14/ALL_50_Comp.csv"
writeFileLine: "'outputPath$'", "speaker,vowel,gender,ethnicity,race,age,place1,duration,time,F0,F1,F2,F3"

# open the metadata table to combine it with our analysis 
Read Table from comma-separated file: "/Users/tatecarson/Downloads/all_50_demo.csv"
table$ = selected$("Table")


for ifile to num
	select Strings list
	fileName$ = Get string... ifile
	Read from file... 'directory_name$'/'fileName$'
	soundID$ = selected$("Sound")
	Read from file... 'directory_name$'/'soundID$'.TextGrid
	textGridID = selected("TextGrid")
	num_labels = Get number of intervals... labeled_tier_number

    # Create the Formant Object for each TextGrid
    select Sound 'soundID$'
    To Pitch: 0.001, 75, 300
    Rename: "pitch"

    select Sound 'soundID$'
    To Formant (burg)... 0 5 5000 0.025 50
    Rename: "formant"
    
   

    # get the speaker name from the file name
    speaker$ = left$(fileName$, 13)

    appendInfoLine: speaker$

    # select the metadata row for the speaker
    select Table 'table$'
    getRow = Search column... subjectLabCode 'speaker$'
    
    # return the value of that row 

    gender$ = Get value... getRow gender
    ethnicity$ = Get value... getRow ethnicity
    race$ = Get value... getRow race
    age$ = Get value... getRow age
    place1$ = Get value... getRow place1

    # print out all of the labels in each file
    for i to num_labels
		select 'textGridID'
        thisPhoneme$ = Get label of interval... labeled_tier_number i
        
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
            thisPhonemeStartTime = Get start point: labeled_tier_number, i
            thisPhonemeEndTime   = Get end point:   labeled_tier_number, i
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
                            ...speaker$, ",",
                            ...thisPhoneme$, ",",
                            ...gender$, ",",
                            ...ethnicity$, ",",
                            ...race$, ",",
                            ...age$, ",",
                            ...place1$, ",",
                            ...duration, ",",
                            ...midpoint, ",",
                            ...pitch, ",",
                            ...f1, ",", 
                            ...f2, ",", 
                            ...f3
        endif
        
    endfor
endfor
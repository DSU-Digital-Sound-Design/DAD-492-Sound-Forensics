writeInfoLine: "Extracting formants..."

# Extract the names of the Praat objects
thisSound$ = "speech-001"
thisTextGrid$ = "speech-001"

# Extract the number of intervals in the phoneme tier
select TextGrid 'thisTextGrid$'
numberOfPhonemes = Get number of intervals: 1  
appendInfoLine: "There are ", numberOfPhonemes, " intervals."

# Create the pitch object
select Sound 'thisSound$'
To Pitch: 0.001, 75, 300
Rename: "pitch"

# Create the Formant Object
select Sound 'thisSound$'
To Formant (burg)... 0 5 5000 0.025 50
Rename: "formant"

# Create the output file and write the first line.
outputPath$ = "/Users/tatecarson/Downloads/formants-new.csv"
writeFileLine: "'outputPath$'", "speaker,vowel,duration,time,F0,F1,F2,F3"

# Loop through each interval on the phoneme tier.

for thisInterval from 1 to numberOfPhonemes
    #appendInfoLine: thisInterval

    # Get the label of the interval
    select TextGrid 'thisTextGrid$'
    thisPhoneme$ = Get label of interval: 1, thisInterval
    #appendInfoLine: thisPhoneme$
    label$ = Get label of interval: 1, thisInterval

    if label$ <> ""
        # Find the midpoint.
        thisPhonemeStartTime = Get start point: 1, thisInterval
        thisPhonemeEndTime   = Get end point:   1, thisInterval
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

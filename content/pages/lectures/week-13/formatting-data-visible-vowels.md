---
title: "Formatting Data for Visible Vowels"
---

Below is the final code from the tutorial. There are a few things you can change to make things a little easier and also to format the data for Visible Vowels. 

```python
#################################################################################
#
# This script extracts F1, F2, F3, and duration from all phonemes in a Sound file.
# It assumes phonemes are on Tier 1 and words are on Tier 2.
# It outputs this information to /Users/joeystanley/Desktop/Projects/Praat/formants.csv
#
# To run this script, open a Sound and TextGrid in Praat and have them selected.
#
# This script was created by following the workshop by Joey Stanley & Lisa Lipani:
# http://joeystanley.com/downloads/191002-formant_extraction.html
# 
# Joey Stanley
# Tuesday, October 1, 2019
# Main Libary, UGA campus, Athens, GA, USA
#
#################################################################################

writeInfoLine: "Extracting formants..."

# Extract the names of the Praat objects
thisSound$ = selected$("Sound")
thisTextGrid$ = selected$("TextGrid")

# Extract the number of intervals in the phoneme tier
select TextGrid 'thisTextGrid$'
numberOfPhonemes = Get number of intervals: 1  
appendInfoLine: "There are ", numberOfPhonemes, " intervals."

# Create the Formant Object
select Sound 'thisSound$'
To Formant (burg)... 0 5 5000 0.025 50

# Create the output file and write the first line.
outputPath$ = "/Users/joeystanley/Desktop/Projects/Praat/formants.csv"
writeFileLine: "'outputPath$'", "file,time,word,phoneme,duration,F1,F2,F3"

# Loop through each interval on the phoneme tier.
for thisInterval from 1 to numberOfPhonemes
    #appendInfoLine: thisInterval

    # Get the label of the interval
    select TextGrid 'thisTextGrid$'
    thisPhoneme$ = Get label of interval: 1, thisInterval
    #appendInfoLine: thisPhoneme$
      
    # Find the midpoint.
    thisPhonemeStartTime = Get start point: 1, thisInterval
    thisPhonemeEndTime   = Get end point:   1, thisInterval
    duration = thisPhonemeEndTime - thisPhonemeStartTime
    midpoint = thisPhonemeStartTime + duration/2
    
    # Get the word interval and then the label
    thisWordInterval = Get interval at time: 2, midpoint
    thisWord$ = Get label of interval: 2, thisWordInterval
      
    # Extract formant measurements
    select Formant 'thisSound$'
    f1 = Get value at time... 1 midpoint Hertz Linear
    f2 = Get value at time... 2 midpoint Hertz Linear
    f3 = Get value at time... 3 midpoint Hertz Linear

    # Save to a spreadsheet
    appendFileLine: "'outputPath$'", 
                      ...thisSound$, ",",
                      ...midpoint, ",",
                      ...thisWord$, ",",
                      ...thisPhoneme$, ",",
                      ...duration, ",",
                      ...f1, ",", 
                      ...f2, ",", 
                      ...f3

endfor

appendInfoLine: newline$, newline$, "Whoo-hoo! It didn't crash!"
```

Line 21 and 22 can be replaced with fixed names so that you don't have to select the Sound and TextGrid objects every time. That would look like this: 

```python
thisSound$ = "sound-name"
thisTextGrid$ = "textgrid-name"
```

Visible vowels requires an F0 row, which is the pitch measurement. To calculate this you need to select the sound, create a pitch object, and then extract the pitch measurements. We Rename the pitch object to "pitch" so that we can extract the formants later. 

```python
# Create the pitch object
select Sound 'thisSound$'
To Pitch: 0.001, 75, 300
Rename: "pitch"
```

Now edit your formant selection code to name it "formant". This is necessary when completing more than one analysis action. Make sure these formant settings work for your sounds. You'll have to do the analysis in Praat manually to check if you're getting good results. 

```python
# Create the Formant Object
select Sound 'thisSound$'
To Formant (burg)... 0 5 5000 0.025 50
Rename: "formant"
```

Next we need to rewrite the order of the headers to match what Visible Vowels expects. Change the following to match the headers from the Visible Vowels spreadsheet.

```python
writeFileLine: "'outputPath$'", "file,time,word,phoneme,duration,F1,F2,F3"
```

There is a possibility that some of your labels will missing. Add an if statement so that your code only runs if the label is not empty. 

```python
if label$ <> ""
## Add code from tutorial here, lines 47-71
endif
```

For each label we need to extract the pitch. Add the following code to extract the pitch below the code that determines the midpoint of the annotation.

```python
 # extract pitch 
selectObject: "Pitch pitch"
pitch = Get value at time: midpoint, "Hertz", "linear"
```

You don't need to get the word or the word interval so you can remove those lines. 

When you extract your formants you need to change a line because you renamed the object above. 

```python
# Extract formant measurements
selectObject: "Formant formant"
f1 = Get value at time... 1 midpoint Hertz Linear
f2 = Get value at time... 2 midpoint Hertz Linear
f3 = Get value at time... 3 midpoint Hertz Linear
```

Finally, add your new elements to the `appendFileLine` section. After converting your csv to a xlsx file you can open it in Visible Vowels.
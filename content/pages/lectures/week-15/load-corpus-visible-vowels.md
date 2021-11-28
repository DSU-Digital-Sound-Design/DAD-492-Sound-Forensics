---
title: "Load the corpus into Visible Vowels"
---

## Setup 

In preparation for your final project we will now load a speech corpus into Visible Vowels. Go [here](https://speechbox.linguistics.northwestern.edu/ALLSSTARcentral/#!/recordings) and download the spontaneous speech ST1 L1 English corpus. This contains spoken english with TextGrid annotations. 

Remember that Visible Vowels requires a [specific format](https://www.visiblevowels.org/#help) for its data. Using the script from the previous tutorial will not work here because the formatting of the CSV files are different. Also, for useful data visualization, metadata is required. Unfortunately, the metadata CSV files are separate from the analysis files you'll create. Find the metadata on the metadata tab on the [SpeechBox homepage](https://speechbox.linguistics.northwestern.edu/#!/home). 

First we'll work with one audio file and TextGrid, then we'll work with the entire folder. Open the first audio file and grid. Notice that there are multiple annotation tiers. The first tier is the sentence, the second tier is the word, and the third tier is the phoneme. The problem is that the phoneme is in a format that we haven't seen before, and different from what Visible Vowels expects. A bit of research revealed that these symbols were from the [ARPABET](https://en.wikipedia.org/wiki/ARPABET) phonetic alphabet, an alternative to IPA. 

## Convert ARPABET to IPA

Lets create the code that will translate APABET to IPA. It is always a good idea to test different features of code in separate files, then combine them into one file later when you know each part works. Create a new Praat script file and name it `arpabet-to-ipa.praat`. Start with the code from the previous tutorial. 

Change your `thisSound` and `thisTextGrid` variables to match the names of whichever files you loaded. Create a variable to store the phoneme tier number. We will use this in multiple places in the code. Firstly, we need to select the TextGrid and get the number of phonemes on that grid. We set the phoneme tier using our variable. 

```c
select TextGrid 'thisTextGrid$'
numberOfPhonemes = Get number of intervals: tierNumber
```

Now find the other places where the tier number needs to be set and change its value. This includes `Get label of interval`, `Get start point`, and `Get end point`. 

Go into the if statement that is checking to see if the current phoneme is blank. We will use regular expressions to replace ARPABET with IPA. Praat script has a helpful function for this called `replace_regex()`. Here's an example of its use: 

```js
thisPhoneme$ = replace_regex$(thisPhoneme$, "AA[0-9]*", "ɑ", 0)
```

The four parameters are the string to be replaced, the regular expression, the replacement, and the number of times to replace. The last parameter is optional and defaults to 0.  Here our regular expression is searching for any strings that start with AA followed by a number. We replace this with the IPA symbol `ɑ`. Now add code to replace the other symbols.

You should now notice that while most of our symbols are correct we're still getting `sil` and `spn` symbols. I'm not sure what these stand for, but we need to filter them out. We also only want to check for phonemes that are longer than 1 character. To do the filtering we will add onto our if statement conditional like so: 

```js
&&  length(thisPhoneme$) > 2 && thisPhoneme$ <> "sil" && thisPhoneme$ <> "spn"
```

The `&&` checks for multiple things to be true at the same time. The `length()` function checks the length of the string. The `<>` checks for inequality. You should now have a CSV with only IPA symbols.

## Combine filtered CSV files with METADATA

Now we have to combine the metadata we downloaded with the CSV we just created. Again, make a new file called `read-table.praat` to test our reading from the metadata CSV. Use a new function to read in CSV files, `Read Table from comma-separated file`. This takes the path to the CSV file. Next store your selected Table in a variable and select that table with code. 

```js
Read Table from comma-separated file: "/Users/tatecarson/Downloads/all_50_demo.csv"

table$ = selected$("Table")

select Table 'table$'
```

You should now see a Table object selected in your Praat Objects window. View and Edit it to see the contents. Now practice selecting the columns you want to add to your analysis table. First lets select the gender column. First we search for a column header `subjectLabCode` for to select the row of participant codes. Then we ask for the participant we want. You can choose any of them. Print this value to the console, it should be a number representing the participant.

```js
getRow = Search column... subjectLabCode ALL_049_F_ENG
```

Now that we have the row number we can get the gender column with the `Get value` function. 

```js
gender$ = Get value... getRow gender
```

Print this values to the console to see if you did it correctly. Now try to select other columns such as ethnicity. 

## Iterate over all files in the folder 

Create another script to test iterating over files in a folder, call it `iterate-files.praat`.  We'll use a function, `Create Strings as file list` to get a list of files in our folder. This creates a list in Praat of every file in the folder that is a .wav file. Look in your Praat Objects window to see the list.

```code
directory_name$ = "/Users/tatecarson/Downloads/ALL_ENG_ENG_ST1" 

Create Strings as file list... list 'directory_name$'/*.wav
```

We then needs to get the number of files using `Get number of strings`. We'll use this number in our for loop. 

Now we'll loop through those files using a for loop. In the loop we'll select the Strings list, get the current file, and store it in a variable. We'll use the `Get string` function to get the name of the file. Write that to the console.

```code  
for ifile to num
    select Strings list
    fileName$ = Get string... ifile
    appendInfoLine: fileName$
endfor
```

Now lets read the file into Praat using `Read from file`. Add this line to your loop: 

```
Read from file... 'directory_name$'/'fileName$'
```

Look at the files that are all now loaded into the Object window. Now open the TextGrids in a similar way, adding this code to your loop. Here we take the name of the sound and use it to get its corresponding TextGrid. 

```code
soundID$ = selected$("Sound")
Read from file... 'directory_name$'/'soundID$'.TextGrid	
```

Return to your `arpabet-to-ipa.praat` file make a duplicate of it and name it `add-metadata.praat`. Add the code that iterates over all the files in the folder. You should be able to combine all of what we've learned to output a CSV file that contains an analysis of all the files in the folder and is also includes each participants corresponding metadata. 

Load this CSV into Visible Vowels and experiment with the results. 
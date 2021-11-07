---
title: "Formants lab" 
---

Look at [this website](https://www.lawlessenglish.com/learn-english/pronunciation/vowels-phonetics/) that explains the various vowel sounds. Record several of them and compare their formants. You should see different formant shapes for each vowel sound and they should be relatively predictable. 

Record the words "mood" and "mode" and compare the formants of each. Even though they are both "o" sounds, the formants will look different and their frequency ranges will differ. 

## Plot formants

We will now make a plot out of our vowels using the first two formants. Make a recording of the following words and call it "MW_vowels": 

* heed, hid, hayed, head, had, hod, hawed, hud, hoes, hood, who'd, how'd, hoyed, hide, height, herd, ahead

If your formants are all over the place you may need to change the settings to fit your voice. This is adjusted in the formant settings section. My formant ceiling is 5000 Hz and I'm searching for 5 formants. You could try to reduce the ceiling to 4200 Hz and number of formants to 4 and see if it helps. 

We'll now create a textgrid. Go back to the objects window, click annotate then "to TextGrid". Save it as "MW_vowels".  Type in "vowels" for the tier name and remove any text in point tiers section. Select both objects and click "View & Edit". You'll now see the text grid. Here is where you will label each vowel. Be careful to only select the vowel part of the word. Once selected click enter then type the label. Label each vowel with the following codes: 

| heed | hid | hayed | head | had | hod | hawed | hud | hoes |
| ---- | --- | ----- | ---- | --- | --- | ----- | --- | ---- |
| ii   | ih  | ei    | eh   | ae  | ah  | aw    | uh  | oh   |

| hood | who'd | how'd | hoyed | hide | height | herd | ahead |
| ---- | ----- | ----- | ----- | ---- | ------ | ---- | ----- |
| oo   | uu    | au    | oi    | ai   | ait    | er   | xx    |

It is important that you use these exact codes so that your plot comes out correct later. Go back to the objects window and click on "Analyze Spectrum" then "to Formant (Burg)". Save it as "MW_vowels". Add the same settings that you used in your format analysis from earlier and click ok. 

Create a new praat script from the windows menu Praat -> "New Praat Script" 

Paste [this code](https://raw.githubusercontent.com/ListenLab/make_vowel_space/main/Extract_formants.txt) in the window. Run the script. You should now have a table of data showing the time for each formant.  Go back to the object window and save the formants table as a csv file. Call it "my_formants.Table".

Download the [RStudio IDE](https://www.rstudio.com/products/rstudio/download/#download) and install it. Download [this script](https://raw.githubusercontent.com/ListenLab/make_vowel_space/main/Plot_vowel_space.R) and open it in RStudio. Edit line 7 to be the directory of where you saved the formants table. If you set everything correctly you should be able to select all the code and click run. You should now have a plot of the vowel space.

Notice the dynamic formant movement from each vowel. Compare this plot that that of your neighbor. You should be able to see key differences in the way you pronounce the vowels. 

Using this method it may be possible to compare the vowels a suspect recording to a known recording.
---
title: "Vegas Shooting Lab" 
---

## Instructions

Use the [analysis](pages/lectures/week-9/MullinsAnalysis.pdf) of the Vegas Shooting from Richard L. Mullins as a guide to recreating his analysis in spreadsheet form. He has a [video](https://www.youtube.com/watch?v=h_N5lOgRmpM&t) where he explains a few more things if you want to watch that. 

Recreate the muzzle waves timing and properties table. In Sonic Visualizer add a time value to the start of each muzzle blast. Then export the annotation layer as a CSV. Open the file in Excel, or Google Sheets, to begin your spreadsheet. Add the delta value by taking the difference between each timing. This can be done easily by using a formula in Excel. See [here](https://www.lifewire.com/how-to-subtract-in-excel-3124091) for a guide on subtracting. Next get the delta delta using the same method as getting the delta. subtracting each element in series. Then to get the RPM use the formula 1/delta*60. Then get the average of the RPM. 

Next compute the total duration of muzzle blast events, what the average time in milliseconds between shots was, and write the RPM. 

NOTE: make sure to save this file as a Excel Workbook so that I can see your formulas. If you save it as a CSV the formulas will be lost. 

Next create a similar table for the supersonic shock waves using the same techniques. The total duration of events and the average time between events should be marginally shorter. The differences occur because the time of arrival of the supersonic crack depends on a few more variables than the muzzle blast. One is the bullet speed relative to the speed of sound, another is the miss distance. 

Next submit a lag chart with the times between the shockwave crack and the muzzle blast. Include a column for deltas. Also include the max lag, min lag, and the difference between them. 


See the plot in the paper. By figuring out the lag times of many recordings we can get a general idea of where the shooter was located. The shooter will be where the lag times are the smallest. 

The technology to create the lag contour map is outside the scope of this class but we can get close. We can recreate it manually by getting the average lag times of recordings at different places and comparing them. 

Please submit the following: 

* For the first recording
    * The sonic visualizer project you used to make your charts 
    * a muzzle wave chart
    * a shock wave chart
    * a lag chart comparing the times 

Then pick three other recordings and compare the lag times of the same volley. Knowing that the shooter was somewhere towards the bottom left of the graph shown in the paper make a determination about how far each recording was from the possible location of the shooter.   

Please read the paper for the general questions and observations. 
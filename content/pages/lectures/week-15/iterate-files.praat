directory_name$ = "/Users/tatecarson/Downloads/ALL_ENG_ENG_ST1" 
labeled_tier_number = 3

Create Strings as file list... list 'directory_name$'/*.wav

num = Get number of strings



for ifile to num
	select Strings list
	fileName$ = Get string... ifile
    appendInfoLine: fileName$

	Read from file... 'directory_name$'/'fileName$'
	soundID$ = selected$("Sound")
	Read from file... 'directory_name$'/'soundID$'.TextGrid
	# textGridID = selected("TextGrid")
	# num_labels = Get number of intervals... labeled_tier_number
    
endfor
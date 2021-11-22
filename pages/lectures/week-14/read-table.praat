## Experimenting with reading in a table of values and combinging them with other tables 

# open the table 
Read Table from comma-separated file: "/Users/tatecarson/Downloads/all_50_demo.csv"

table$ = selected$("Table")

select Table 'table$'

# Get the row that matches the column and subjectlabcode 
getRow = Search column... subjectLabCode ALL_049_F_ENG

# return the value of that row 
gender$ = Get value... getRow gender
ethnicity$ = Get value... getRow ethnicity

appendInfoLine: gender$
appendInfoLine: ethnicity$

## TODO: how do I add this now into a table? 
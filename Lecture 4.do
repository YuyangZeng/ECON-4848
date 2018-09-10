/* Lecture 4 09/10/18 - Name Yuyang Zeng*/
clear
cd "C:\Users\yuze5659\Downloads" /*folder path - change to desktop folder*/

capture log close
set logtype text
log using logname.txt, replace /*Change logname to the desired file name*/
set more off

use loanapp_4848

*command 1 - all of our commands go here
*relabeling a variable label
* label variable [varname] "label goes here"
label variable action "action =1 or =2 if loan accepted, =3 if denied"

*relabel variable values
label define actionlabel 1 "accept" 2 "accept after review" 3 "deny"
label values action actionlabel

tabulate action
label variable action "Outcome of loan application"
tabulate action

*generating new variables 
*gen [newvariable] = [function of existing variables]

gen ltv = loanamt/apr
gen inloanamt = log(loanamt)
gen appinc2 = appinc^2
drop appinc2
/*gen appinc2 = appinc+2  we cannot overwrite the same varaible by STATA we 
have to drop the previous one */
gen appinc2 = appinc+2
label variable ltv "loan to value ratio"


*Using logic to create new variables and modify existing variables 
*gen [varname]
*templace [varname] = # if [othervar] == [value]

*EX: create a new variable Approved that's equal to 1 if the loan 
*was approved, and equal to 0 if the loan was denied 

gen approved = 0
replace approved =1 if action == 1 
replace approved =1 if action == 2

drop approved 
gen approved = 0
replace approved =1 if action ==1 | action ==2 |


browse 


capture log close /*Don't delete or modify this line*/

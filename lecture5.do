/* Lecture # 09/12/18 - Yuyang Zeng*/
clear
cd "C:\Users\yuze5659\Downloads" /*folder path - change to desktop folder*/

capture log close
set logtype text
log using lecture5.txt, replace /*Change logname to the desired file name*/
set more off

use loanapp_4848

*command 1
*reminder about logic
* create a variable =1 if loan approved, =0 if denied
gen approved = 0 
replace approved =1 if action ==1 | action ==2

drop approved 
gen approved =0 
replace approved =1 if action !=3

drop approved 
gen approved =0 
replace approved =1 if action <3

drop approved 
gen approved =0 
replace approved =1 if action <=2

*logical or is |
*logical and is &
tabulate appinc

*recording bad data as missing 
replace appinc = . if appinc == 666
tabulate appinc

*Descriptive statistics
* Mean = simple averages of the variable
* Median = 50% of observations are above, 50% are below
* Percentiles = xth percentiles has X% of obeservation below, and 1-x% observation above
* Variance = measure of how "spread " out the data are
* Standard deviation = square root of the variance 
* Minimum, Maxmium, range, N(count)

*Goal;generate some basic descriptive statistics
*Simplest command = sum to summarize data

* sum[var1] [var2],detail
sum appinc atotinc cototinc
sum appinc atotinc cototinc, detail
tabstat appinc atotinc cototinc, statistics(mean median sd n)
*make this nicer llooking with the colunbs(statistics) option

tabstat appinc atotinc cototinc, statistics(mean median sd n) columns(statistics)

 *bysort command as a way to analyze subgroups of the data
 *Are miniority applicants approved less often for loans?
 
 *bysort [varname] : sum [var1] [var2]
 
 gen minority = 0
 replace minority =1 if black == 1 | hispan ==1
 
 sum approved appinc if minority ==1
 sum approved appinc if minority ==0
 
 bysort minority: sum approved appinc










capture log close /*Don't delete or modify this line*/

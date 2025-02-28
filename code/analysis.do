log using logs/analysis.txt, text replace
set obs 100
gen a = rnormal()
gen b = runiform()
gen c = a*b + runiform()
save data/dataset, replace
reghdfe a b c
log close
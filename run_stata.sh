# the following assumes the stata executable in in your $PATH
# otherwise you need to specify the entire path to the executable,
# e.g. /Applications/Stata/StataSE.app/Contents/MacOS/
# (see https://www.stata.com/support/faqs/mac/advanced-topics/)

# run all do files in sequence
stata-se -b code/analysis.do
#stata-se -b code/analysis-2.do
#..etc...

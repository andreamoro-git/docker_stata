# In a replication package, it is advisable to include a script that runs the
# do files even if one doesn't want or know how to use Docker. The script assumes
# that Stata is installed in the system the stata executable in in your $PATH
# otherwise you need to specify the entire path to the executable,
# e.g. /Applications/Stata/StataSE.app/Contents/MacOS/stata-se
# (see https://www.stata.com/support/faqs/mac/advanced-topics/)

# run all do files in sequence
stata-se -b code/analysis.do
#stata-se -b code/analysis-2.do
#..etc...

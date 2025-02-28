# build the stata image (requires placing stata license file inside Environment)
docker build -t stataimg Environment/

# execute the do file where ${PWD} is the full path of the location of your stata license
# (in your system the name of the variable PWD may be different, check with echo $PWD)
# the -v mounts your PWD into the container filesystem: /project is the directory specified in
# the dockerfile as the working directory
docker run --init -it --rm --mount "type=bind,source=${PWD}/Environment/stata.lic,target=/usr/local/stata/stata.lic" -v "${PWD}":/project stataimg -b code/analysis.do

# NOTES
# to run stata interactively, remove -b code/analysis.do at the end of the command
# if you copied the license into your image (see the Dockerfile), you can remove the --mount "..." from your command 

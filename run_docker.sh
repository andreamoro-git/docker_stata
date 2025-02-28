# build the stata image (requires placing stata license file inside Environment)
docker build -t stataimg Environment/

STATALIC="path/to/stata/license"
# execute the do file where ${STATALIC} is the full path of the location of your stata license
# and $PWD is your current working directory
# (in your system the name of the variable PWD may be different, check with echo $PWD)
# the -v mounts your $PWD into the container's filesystem: /project is the directory specified in
# the dockerfile as the working directory
docker run --init -it --rm --mount "type=bind,source=${STATALIC}/stata.lic,target=/usr/local/stata/stata.lic" -v "${PWD}":/project stataimg -b code/analysis.do

# command if you chose to copy the license into the image (see Dockerfile)
# docker run --init -it --rm -v "${PWD}":/project stataimg -b code/analysis.do

# NOTE
# to run stata interactively, remove -b code/analysis.do at the end of the command

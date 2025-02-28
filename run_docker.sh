# build the stata image (requires placing stata license file inside Environment)
docker build -t stataimg Environment/

# modify below accordingly: full path to license location
STATALIC="/path/to/stata/license"

# Note: $PWD below is your current working directory
# (in your system the name of the variable PWD may be different, check with echo $PWD or echo $pwd)
# the -v mounts your $PWD into the container's filesystem: /project is the directory specified in
# the dockerfile as the working directory
docker run --init -it --rm --mount "type=bind,source=${STATALIC}/stata.lic,target=/usr/local/stata/stata.lic" -v "${PWD}":/project stataimg -b code/analysis.do

# Use the following command if you chose to copy the license into the image (see Dockerfile)
# Note: to run stata interactively, remove -b code/analysis.do at the end of the command
# docker run --init -it --rm -v "${PWD}":/project stataimg -b code/analysis.do


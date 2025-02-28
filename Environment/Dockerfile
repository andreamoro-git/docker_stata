# syntax=docker/dockerfile:1.14.0
FROM dataeditors/stata18-se:2024-12-18

# WARNING: you don't want to include this line if you 
# intend to distribute the image, so this is commented by default
# Optional: copy the stata license
# (it must be in the same directory as the Dockerfile or a subdirectory)
# COPY stata.lic /usr/local/stata/stata.lic 

# create a stata user and set the PATH
USER statauser:stata
ENV PATH="$PATH:/usr/local/stata" 

 # create a working directory for setup
 # and execute the setup.do file
 WORKDIR /setup
 COPY setup.do setup.do

 # you may need to change this if your executable is not called stata-se
 # e.g. if you are using Stata/MP, you would probably use stata-mp
 RUN stata-se -b setup.do 

 # mount your project root directory here when you createing the container (see run_docker.sh) 
 WORKDIR /project

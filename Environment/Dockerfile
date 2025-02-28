# syntax=docker/dockerfile:1.14.0
FROM dataeditors/stata18-se:2024-12-18

# copy the stata license
# WARNING: you don't want to include this line if you 
# intend to distribute the image, so this is commented by default
# COPY stata.lic /usr/local/stata/stata.lic 

USER statauser:stata
ENV PATH="$PATH:/usr/local/stata" 

 # create a working directory for setup
 # and execute the setup.do file
 WORKDIR /setup
 COPY setup.do setup.do
 RUN stata-se -b setup.do 

 # mount your project root directory here when you create a container (see below) 
 WORKDIR /project

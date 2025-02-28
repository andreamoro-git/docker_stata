# How to run Stata inside a Docker container

More explanations [in this post](https://andreamoro.net/blog/2025/02/26/How-to-run-stata-in-a-docker-container.html). 

## Steps
0. Clone the repository
1. Familiarize yourself with the files included in this distribution, and their comments, particularly run_docker.sh and Environment/Dockerfile
2. Figure out where your Stata license file is. Just google if you have no idea. Copy it inside Environment
3. Modify the second line (FROM:) in Environment/Dockerfile according to your Stata license and preferences. The full list of images:tags is available [at the dataeditors docker hub](https://hub.docker.com/u/dataeditors)
4. Place your do files inside code
5. If you need external packages in your installation, include them in Environment/setup.do
6. Run run_docker.sh


To run stata interactively, type from the root of your project (where ($PWD) stands for the full path to your working directory and statimg is the name of your image:
	``` 
	docker run --init -it --rm \
			   --mount "type=bind,source=${PWD}/Environment/stata.lic, \
			            target=/usr/local/stata/stata.lic" \
			   -v "${PWD}":/project   \ 
			   stataimg
	```

Note: if you don't need to install any packages, or intend to do it inside your do files, you don't need to build any image. Just type this from the root of your project. 

	``` 
	docker run --init -it --rm \
			   --mount "type=bind,source=${PWD}/stata.lic, \
			            target=/usr/local/stata/stata.lic" \
				-v "${PWD}/my_project_do_files":/project   \ 
				dataeditors/stata18-se:2024-12-18
	```
		
That's all. Let me know if it does not work for you. 

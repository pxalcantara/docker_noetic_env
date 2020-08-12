# docker_noetic_env
This project creates and configures a docker environment for development with ROS Noetic installed. This project was created with the big help of [@ximenesfel](https://github.com/ximenesfel)

- [Description](##Description)
- [Installation](##Installation)
- [Usage](##Usage)
- [Contributing](##Contributing)

## Description
### Host Configuration (Tested Environment)
This is the current configuration of my machine so this project was tested in these conditions. If you've tried this project with another configuration and it works, please, let me know so, I can update the documentation for future users. 
- **Ubuntu 16.04;**
- **NVIDIA driver version:** 430.64;
- **Docker Version:** 19.03.12;
### Project Organization  
This project is organized as bellow:
- **docker** : folder with all files and folders to make the environment;
  - ***Dokerfile***: file to do the configuration of the docker image;
  - ***.bashrc***: costumized `bash` file that is used inside the environment when the container is created;
  - ***.bash_aliases***: file used to add some *alias* as shortcuts to help the development with this environment. This file is also copied inside the container.
  - ***run_docker.sh***: this script configures the environment. It builds the docker image, creates the container, and access it so, if everything goes well, after the execution of this script, You'll be in the terminal inside the docker container.
  - ***home-host***: this folder is a volume that is shared with the container. It is connected with the folder `/root/home` inside the container so, everything inside the folder `/root/home` will be also in the folder `home-host` in the host and vice-versa.   
  
  ***IMPORTANT!:*** everything that you need to keep using this environment as, source code, files, folders, **MUST** be inside the `/root/home` folder, otherwise, they'll be deleted once the image is built and the container is created again.
  
### Docker Environment Configuration
- **Ubuntu 20.04;**
- **ROS Noetic;**
- **Some installed packages/programs;**
  - nano;
  - vim;
  - git;
  - wget;
  - curl;
  - sudo;
  - terminator;
  - bash-completion; 

## Installation

### Install the repository
If you already have docker installed and configured in your machine, just clone the repository:
```
  $ git clone https://github.com/pxalcantara/docker_noetic_env.git
```


## Usage
 Give permission to the `run_docker.bash` script
 ```
 $ chmod a+rwx run_docker.bash
 ```
 Run the script. It'll make the configuration and, after that, You'll be inside the container. If it's the first time that you're running it, maybe it'll take some time to build the docker image and download the packages. Inside `.../docket_noetic_env/docker`, run:
 ```
 ./run_docker.bash
 ```

## Contributing
If you have any comments, doubts, or suggestions, I'll be more than happy to know them, so, feel free to open an issue or a Pull Request with your collaboration.

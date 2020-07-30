FROM osrf/ros:noetic-desktop-full-focal

#install packages to enable work in this environment
RUN export DEBIAN_FRONTEND=noninteractive; \
	apt-get update && \
	apt-get install -y nano && \
	apt-get install -y vim && \
	apt-get install -y git && \
    apt-get install -y wget && \
    apt-get install -y curl && \
    apt-get install -y sudo && \
    apt-get install -y terminator && \
    apt-get install -y bash-completion && \
    apt-get install -y software-properties-common && \
	apt-get install -y apt-utils && \
	apt-get install -y build-essential && \
	apt-get install -y locales && \
	apt-get install -y pkg-config
	
RUN export LANGUAGE=en_US.UTF-8; \
    export LANG=en_US.UTF-8;
#    export LC_ALL=en_US.UTF-8; \
#    locale-gen en_US.UTF-8: \
#    DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales

#RUN rm .bashrc
#COPY .bashrc /root 

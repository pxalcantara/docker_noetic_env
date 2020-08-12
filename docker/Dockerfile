FROM osrf/ros:noetic-desktop-full-focal

# nvidia-container-runtime
ENV NVIDIA_VISIBLE_DEVICES \
    ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES \
    ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics

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

# Dependencies for glvnd and X11.
RUN apt-get update \
  && apt-get install -y -qq --no-install-recommends \
    libglvnd0 \
    libgl1 \
    libglx0 \
    libegl1 \
    libxext6 \
    libx11-6 \
  && rm -rf /var/lib/apt/lists/*

#Add .bashrc and .bash_aliases files to the docker so it starts with a constumized environment
COPY .bashrc /root 
COPY .bash_aliases /root

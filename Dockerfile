# Use Ubuntu 20.04 LTS as the base image
FROM ubuntu:20.04

# Avoid prompts during package installation
ARG DEBIAN_FRONTEND=noninteractive

# Install Python 3.10 and pip
RUN apt-get update && apt-get install -y software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y python3.10 python3.10-dev python3.10-venv python3-pip && \
    python3.10 -m pip install --upgrade pip

# Set the working directory inside the container to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Use pip to install any needed packages specified in requirements.txt
# Note: Ensure that pip is pointing to the Python 3.10 installation
RUN python3.10 -m pip install -r stt_requirements.txt && \
    python3.10 -m pip install -r avi_requirements.txt

# Run main.py when the container launches
CMD ["python3.10", "main.py"]

# Use Ubuntu 20.04 LTS as the base image
FROM python:3.10-slim-buster

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

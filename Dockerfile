# FROM  ubuntu 20 lts
FROM ubuntu:20.04

# Install python3
RUN apt-get update && apt-get install -y python3 python3-pip python3-dev

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install -r avi_requirements.txt
RUN pip install -r stt_requirements.txt

# run main.py when the container launches
CMD ["python", "main.py"]
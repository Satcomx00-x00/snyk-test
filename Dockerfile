# FROM  ubuntu 20 lts
FROM python:3.9-slim-buster

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# upgrade pip
RUN pip install --upgrade pip

# Install any needed packages specified in requirements.txt

RUN pip install --force-reinstall --ignore-requires-python -r avi_requirements.txt
# RUN pip install --force-reinstall --ignore-requires-python -r stt_requirements.txt

# run main.py when the container launches
CMD ["python", "main.py"]
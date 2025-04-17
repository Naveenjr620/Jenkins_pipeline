# Use official Ubuntu base image
FROM ubuntu:latest
 
# Set timezone and install dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    tzdata
 
# Set working directory
WORKDIR /app
 
# Copy all files into the container
ADD . /app
 
# Create virtual environment and install Python dependencies
RUN python3 -m venv venv && \
    ./venv/bin/pip install --upgrade pip && \
    ./venv/bin/pip install -r requirements.txt
 
# Expose the Flask port
EXPOSE 5000
 
# Command to run the Flask app
CMD ["./venv/bin/flask", "run", "--host=0.0.0.0"]
 
 
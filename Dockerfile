# Use the official Python base image
FROM python:3.10-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set working directory
WORKDIR /app

# Copy only requirements first (if you have it)
# COPY requirements.txt .

# Install system dependencies and python packages
RUN pip install --upgrade pip \
    && pip install flask pandas openpyxl

# Copy the entire app
COPY . .

# Expose the port Flask runs on
EXPOSE 5000

# Run the app
CMD ["python", "app.py"]
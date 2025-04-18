# Use a lightweight Python image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy all project files into the container
COPY . /app

# Install system dependencies (for pandas/openpyxl/reportlab)
RUN apt-get update && apt-get install -y \
    build-essential \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    libjpeg-dev \
    libfreetype6-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install --upgrade pip
RUN pip install flask pandas openpyxl reportlab itsdangerous

# Expose the port Flask will run on
EXPOSE 5000

# Set environment variable so Flask runs in production mode
ENV FLASK_ENV=production

# Start the app
CMD ["python", "app.py"]

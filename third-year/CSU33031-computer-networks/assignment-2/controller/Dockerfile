# Use a specific Python base image with the desired version.
FROM python:3

# Set a working directory inside the container.
WORKDIR /app

# Copy only the necessary files for your application.
COPY main.py /app/
COPY requirements.txt /app/

# Install application dependencies.
RUN pip install -r requirements.txt

# Define the default command to run your Python application.
CMD ["python3", "-u", "main.py"]
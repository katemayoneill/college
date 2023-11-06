# Use a specific Python base image with the desired version.
FROM python:3

# Set a working directory inside the container.
WORKDIR /app

# Copy only the necessary files for your application.
COPY service.py /app/
COPY requirements.txt /app/

# Install application dependencies.
RUN pip install -r requirements.txt

# Expose the necessary ports for your application.
EXPOSE 51510
EXPOSE 51511
EXPOSE 51512

# Define the default command to run your Python application.
CMD ["python3", "-i", "service.py"]

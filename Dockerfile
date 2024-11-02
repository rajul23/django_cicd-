FROM python:3

# Set the working directory
WORKDIR /data

# Install system dependencies for distutils
RUN apt-get update && apt-get install -y python3-distutils && apt-get clean

# Install Django
RUN pip install django==3.2

# Copy the project files
COPY . .

# Run migrations
RUN python manage.py migrate

# Expose the application port
EXPOSE 8000

# Start the application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]


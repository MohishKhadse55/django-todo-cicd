FROM gcr.io/library/python:3

WORKDIR /data

# Install distutils (required by Django 3.2)
RUN apt-get update && apt-get install -y python3-distutils && rm -rf /var/lib/apt/lists/*

# Install Django
RUN pip install django==3.2

COPY . .

# Run database migrations
RUN python manage.py migrate

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]


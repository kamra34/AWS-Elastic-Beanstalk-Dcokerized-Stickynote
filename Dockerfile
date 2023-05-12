FROM python:3.9

WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000

# Define environment variable
ENV FLASK_APP=app.py

CMD ["python", "app.py", "--host", "0.0.0.0"]
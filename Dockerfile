# Base image
FROM python:3.9

# Set working directory
WORKDIR /app

# Copy files
COPY app.py /app
COPY requirements.txt /app
COPY model /app/model
COPY ms /app/ms

# Install dependencies
RUN pip install -r requirements.txt

# Run the application
EXPOSE 8000
ENTRYPOINT ["gunicorn", "-b", "0.0.0.0:8000", "--access-logfile", "-", "--error-logfile", "-", "--timeout", "120"]
CMD ["app:app"]

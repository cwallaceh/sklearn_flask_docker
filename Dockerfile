FROM python:3.9.5

COPY model/model_binary.dat.gz /app
COPY requirements.txt /app
COPY app.py /app
COPY /ms /app

WORKDIR /app

RUN pip install -r requirements.txt

EXPOSE 8000
ENTRYPOINT ["gunicorn", "-b", "0.0.0.0:8000", "--access-logfile", "-", "--error-logfile", "-", "--timeout", "120"]
CMD ["app:app"]

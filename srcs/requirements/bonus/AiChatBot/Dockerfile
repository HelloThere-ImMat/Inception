FROM debian:bullseye

RUN mkdir /app

COPY requirements.txt /app/requirements.txt

RUN apt update
RUN apt install python3 python3-pip -y
RUN pip install --no-cache-dir -r /app/requirements.txt

COPY app.py /app/app.py

EXPOSE 5000

CMD ["python3", "/app/app.py"]


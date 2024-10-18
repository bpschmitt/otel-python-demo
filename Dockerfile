FROM python:3.12.7-slim-bullseye

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

RUN opentelemetry-bootstrap -a install

COPY . .

EXPOSE 8080

CMD [ "opentelemetry-instrument", "flask", "run", "--host=0.0.0.0", "-p 8080"]
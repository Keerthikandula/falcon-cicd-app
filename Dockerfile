FROM python:3.11-alpine

WORKDIR /code

COPY . .

RUN pip install -r requirements.txt

CMD ["gunicorn", "-b", "0.0.0.0:8000", "app:app"]

EXPOSE 8000
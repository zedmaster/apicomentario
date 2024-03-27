
FROM python:3.7.4
WORKDIR /app
COPY app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
EXPOSE 8000
CMD ["gunicorn", "app.api:app", "--log-level", "debug", "0.0.0.0:8000"]
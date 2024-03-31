FROM python:3.7.4
WORKDIR /app
COPY app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
CMD ["gunicorn", "app.api:app", "-b", "0.0.0.0:8000"]
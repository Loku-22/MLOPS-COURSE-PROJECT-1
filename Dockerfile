FROM python:slim

# Copy your service account JSON file
COPY sharp-quest-459013-d6-80afa805dd28.json /app/keyfile.json

# Set GOOGLE_APPLICATION_CREDENTIALS env variable
ENV GOOGLE_APPLICATION_CREDENTIALS=/app/keyfile.json

ENV PYTHONDONTWRITEBYTECODE = 1 \
    PYTHONUNBUFFERED = 1

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    libgomp1 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


COPY . .

RUN pip install --no-cache-dir -e .

RUN python pipeline/training_pipeline.py

EXPOSE 5000

CMD ["python","application.py"]

ARG GOOGLE_APPLICATION_CREDENTIALS
ENV GOOGLE_APPLICATION_CREDENTIALS=$GOOGLE_APPLICATION_CREDENTIALS
COPY $GOOGLE_APPLICATION_CREDENTIALS /app/keyfile.json
FROM python:3.12.8-bookworm

RUN apt-get update && apt-get install -y jq && rm -rf /var/lib/apt/lists/*

ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY default_config.yml main.py ./
COPY broadlink_ac_mqtt ./broadlink_ac_mqtt

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD [ "/run.sh" ]

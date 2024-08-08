FROM ubuntu:latest
# Install dependencies
RUN apt-get update && \
    apt-get install -y \
        software-properties-common \
        python3.10 \
        python3-pip \
        python3-venv \
        git && \
    python3 -m venv /opt/venv && \
    . /opt/venv/bin/activate && \
    pip install --upgrade pip && \
    pip install PyYAML

COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

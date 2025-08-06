FROM jlesage/baseimage-gui:ubuntu-24.04-v4.9.0

RUN apt update
RUN apt install -y software-properties-common
RUN add-apt-repository -y ppa:deadsnakes/ppa
RUN apt update
RUN apt install -y python3 python3-pip python3-venv

RUN python3 -m venv /venv
RUN /venv/bin/pip install --no-cache-dir uv

RUN mkdir /app
WORKDIR /app
RUN touch umu-run
RUN /venv/bin/uv add --script umu-run 'python-xlib' 'urllib3' 'truststore'

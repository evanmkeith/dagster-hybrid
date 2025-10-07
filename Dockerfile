# FROM python:3.12-slim
# # Add any steps to install project system dependencies like java

# WORKDIR /opt/dagster/app

# COPY . /opt/dagster/app

# # Add steps to install the Python dependencies for your Dagster project
# # into the default Python on PATH
# # For example, this project uses setup.py and we install all dependencies into the Docker container
# # using `pip`.

# RUN pip install -e .

FROM python:3.12-slim

RUN apt-get update && apt-get install -y \
    build-essential \
    libfreetype6-dev \
    libpng-dev \
    pkg-config \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/dagster/app

# Pin setuptools to avoid wordcloud build issues
RUN pip install --upgrade pip "setuptools<70.0.0"

COPY . /opt/dagster/app

RUN pip install -e 
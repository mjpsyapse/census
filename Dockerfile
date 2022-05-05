FROM python:3.9

RUN useradd --create-home user
USER user
ENV PATH=/home/user/.local/bin:$PATH
WORKDIR /home/user
RUN python -m pip install --upgrade pip wheel setuptools
RUN python -m pip install dbt-trino

ADD ./pipeline /wrk/pipeline

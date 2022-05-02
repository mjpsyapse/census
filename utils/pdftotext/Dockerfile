FROM python:3.10

RUN apt update -y && apt install -y build-essential libpoppler-cpp-dev pkg-config
RUN pip install pdftotext
WORKDIR /wrk
ADD main.py /wrk/main.py

ENTRYPOINT ["python", "main.py"]

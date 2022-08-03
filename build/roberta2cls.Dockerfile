FROM python:3.7-slim
RUN pip install --upgrade pip
RUN mkdir /app
WORKDIR /app
COPY ./requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt
COPY ../model/roberta_2cls.onnx /app/model/roberta_3cls.onnx
COPY ../model/*.json /app/model/
COPY ../senti /app/senti
COPY ../config /app/config
COPY ./main.py /app/main.py
EXPOSE 9000
CMD ["python", "main.py"]
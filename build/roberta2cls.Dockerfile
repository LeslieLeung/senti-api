FROM python:3.8-slim
RUN pip install --upgrade pip
RUN mkdir /app
WORKDIR /app
COPY ./requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple
COPY ../model/roberta_2cls.onnx /app/model/roberta_2cls.onnx
COPY ../model/*.json /app/model/
COPY ../senti /app/senti
COPY ../config /app/config
COPY ./main.py /app/main.py
EXPOSE 9000
CMD ["python", "main.py"]

init:
	pip install -r requirements.txt

docker-roberta3cls:
	docker build -t roberta3cls --platform linux/amd64 -f build/roberta3cls.Dockerfile .

docker-roberta2cls:
	docker build -t roberta2cls --platform linux/amd64 -f build/roberta2cls.Dockerfile .
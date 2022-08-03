
init:
	pip install -r requirements.txt

roberta3cls:
	docker build -t roberta3cls --platform linux/amd64 -f build/roberta3cls.Dockerfile .

roberta2cls:
	docker build -t roberta2cls --platform linux/amd64 -f build/roberta2cls.Dockerfile .

release-roberta3cls:
	docker build -t ccr.ccs.tencentyun.com/ameow_projects/senti-api:roberta3cls --platform linux/amd64 -f build/roberta3cls.Dockerfile .
	docker push ccr.ccs.tencentyun.com/ameow_projects/senti-api:roberta3cls

release-roberta2cls:
	docker build -t ccr.ccs.tencentyun.com/ameow_projects/senti-api:roberta2cls --platform linux/amd64 -f build/roberta2cls.Dockerfile .
	docker push ccr.ccs.tencentyun.com/ameow_projects/senti-api:roberta2cls

release: release-roberta2cls release-roberta3cls
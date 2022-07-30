from senti.base_model import BaseModel


class Roberta3Cls(BaseModel):
    def __init__(self):
        self.labels = {0: "negative", 1: "neutral", 2: "positive"}
        self.model_name = "roberta_3cls"
        super().__init__(labels=self.labels, model_name=self.model_name)


if __name__ == '__main__':
    test_cases = [
        "你好，世界！",
        "今天真是日了狗了",
        "今天我和bug必须没一个",
    ]
    model = Roberta3Cls()
    for test_case in test_cases:
        res = model.predict(test_case)
        print(f"{test_case}: {res}")

from fastapi import FastAPI
import uvicorn

from senti import Roberta2Cls, Roberta3Cls

app = FastAPI()


@app.get("/predict/{model_name}/{text}")
async def predict(model_name: str, text: str):
    if model_name == "roberta-3cls":
        model = Roberta3Cls()
    elif model_name == "roberta-2cls":
        model = Roberta2Cls()
    else:
        return {"message": "model not supported"}
    return {"senti": model.predict(text)}


if __name__ == '__main__':
    uvicorn.run("main:app", host="0.0.0.0", port=9000)

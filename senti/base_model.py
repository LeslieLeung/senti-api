from transformers import AutoTokenizer
import onnxruntime as rt
import numpy as np
import os

import config.constants as constants


class BaseModel:
    def __init__(self, **kwargs):
        self.tokenizer = AutoTokenizer.from_pretrained(os.path.join(constants.project_path, "model"))
        self.sess = rt.InferenceSession(os.path.join(constants.project_path, "model", kwargs["model_name"] + ".onnx"))
        self.labels = kwargs['labels']

    def convert_label(self, label):
        return self.labels[label]

    def predict(self, text):
        inputs = self.tokenizer(text, return_tensors="np")
        inputs = {k: v.astype(np.int64) for k, v in inputs.items()}
        outputs = self.sess.run(output_names=["logits"], input_feed=dict(inputs))
        output = np.argmax(outputs[0], axis=-1)
        return self.convert_label(output[0])

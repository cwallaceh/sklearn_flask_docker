import pandas as pd
from ms import model


def predict(X, model):
    prediction = model.predict(X)[0]
    return prediction


def get_model_response(json_data):
    X = pd.DataFrame.from_dict(json_data)
    prediction = predict(X, model)
    if prediction == 1:
        label = "M"
    else:
        label = "B"
    return {
        'status': 200,
        'label': label,
        'prediction': int(prediction)
    }

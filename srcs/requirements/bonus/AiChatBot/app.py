import openai

from flask import Flask, render_template, request
from werkzeug.urls import url_quote
import openai

app = Flask(__name__)
# openai.api_key = 'YOUR_API_KEY'

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/generate', methods=['POST'])
def generate():
#     user_input = request.form['user-input']
#     response = openai.Completion.create(
#         engine="text-davinci-003",
#         prompt=user_input,
#         max_tokens=150
#     )
#     generated_text = response.choices[0].text.strip()
	generated_text = "bonjour"
	return render_template('index.html', output=generated_text)

if __name__ == '__main__':
    app.run(debug=True)

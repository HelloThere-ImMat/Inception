// Assume this is your JavaScript code in your website

const apiUrl = 'https://api.openai.com/v1/engines/davinci-codex/completions';  // Replace with the correct API endpoint

const apiKey = 'YOUR_OPENAI_API_KEY';  // Replace with your actual API key

async function getChatGPTResponse(prompt) {
    const response = await fetch(apiUrl, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'Authorization': `Bearer ${apiKey}`,
        },
        body: JSON.stringify({
            prompt: prompt,
            max_tokens: 150,
        }),
    });

    const data = await response.json();
    return data.choices[0].text.trim();
}

// Example usage
const prompt = 'Tell me a joke.';
getChatGPTResponse(prompt).then(response => {
    console.log(response);
    // Use the response in your website as needed
});

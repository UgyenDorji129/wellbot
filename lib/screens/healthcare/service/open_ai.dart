import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> generateResponse(String input) async {
  const String apiKey = r"Your open ai keys goes here";
  const String endpoint = 'https://api.openai.com/v1/chat/completions';

  // Construct the request body
  Map<String, dynamic> requestBody = {
    'model': 'gpt-3.5-turbo', // Specify the GPT model you want to use
    'messages': [
    {"role": "system", "content": "You are expert in health care and diseace detections through symptoms. Just give me top 5 disease based on the symptoms and little descriptions."},
    {"role": "user", "content": input}
  ],
  };

  // Encode the request body as JSON
  String jsonBody = json.encode(requestBody);

  // Make the HTTP POST request
  final response = await http.post(
    Uri.parse(endpoint),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    },
    body: jsonBody,
  );
  
  // Check if the request was successful
  if (response.statusCode == 200) {
    Map<String, dynamic> data = json.decode(response.body);
    return data['choices'][0]['message']['content'].toString();
  } else {
    // Handle error
    throw Exception('Failed to generate response: $response');
  }
}
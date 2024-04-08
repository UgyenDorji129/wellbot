import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> generateReportAnalysis(String input) async {
  const String apiKey = r"Your open ai key goes here";
  const String endpoint = 'https://api.openai.com/v1/chat/completions';
  // Construct the request body
  Map<String, dynamic> requestBody = {
    'model': 'gpt-3.5-turbo', // Specify the GPT model you want to use
    'messages': [
    {"role": "system", "content": "You are expert in health care and health report analysis. You are provided with the detailed health report. Go through these reports and generate me a report analysis describing about the disease. Also exlain me do and don't to prevent further spreading. Suggest some cure and home remidies if possible."},
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
    // Parse the response JSON
    Map<String, dynamic> data = json.decode(response.body);
    // Extract and return the generated text
    return data['choices'][0]['message']['content'].toString();
  } else {
    // Handle error
    throw Exception('Failed to generate response: $response');
  }
}
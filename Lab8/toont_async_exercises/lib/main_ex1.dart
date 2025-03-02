import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchIPAddress() async {
  final url = Uri.parse('https://api.ipify.org?format=json');
  
  try {
    final response = await http.get(url);
    
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      print('Your IP Address: ${data["ip"]}');
    } else {
      print('Failed to load IP address: ${response.statusCode}');
    }
  } catch (e) {
    print('Error fetching IP address: $e');
  }
}

void main() async {
  await fetchIPAddress();
}

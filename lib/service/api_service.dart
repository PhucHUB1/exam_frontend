import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://localhost:8080';


  Future<List<dynamic>> getAllPlaces() async {
    final response = await http.get(Uri.parse('$baseUrl/api/places'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load places');
    }
  }

  Future<void> ratePlace(int placeId, int userId, int rating) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/places/$placeId/rate'),
      body: {
        'userId': userId.toString(),
        'rating': rating.toString(),
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to rate place');
    }
  }
}

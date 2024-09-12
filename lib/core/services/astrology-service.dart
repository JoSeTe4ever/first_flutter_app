import 'dart:convert';
import 'package:http/http.dart' as http;

class AstrologyService {
  final String _apiKey = '886EKEGISYmsh0xKrQBlkj83tphgp1yJpb5jsn3zsyxwLsoZLN';
  final String _apiHost = 'astrologer.p.rapidapi.com';

  Future<Map<String, dynamic>> getBirthCard(Map<String, dynamic> requestBody) async {
    final url = Uri.parse('https://astrologer.p.rapidapi.com/api/v4/birth-chart');
    final response = await http.post(
      url,
      headers: {
        'accept': 'application/json',
        'x-rapidapi-key': _apiKey,
        'x-rapidapi-host': _apiHost,
        'Content-Type': 'application/json',
      },
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load birth card');
    }
  }
}
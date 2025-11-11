import 'dart:convert';
import 'package:http/http.dart' as http;

class AstrologyModule {
  final String apiKey = 'LA_TUA_API_KEY_ASTRO';

  Future<Map<String, String>> getSign(String date, double lat, double lon) async {
    final url = Uri.parse(
        'https://api.astrologyapi.com/v1/sun_sign_prediction/daily/$date?latitude=$lat&longitude=$lon&api_key=$apiKey');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return {
        'zodiac': data['sun_sign'] ?? 'Sconosciuto',
        'ascendant': data['ascendant'] ?? 'Sconosciuto',
      };
    } else {
      throw Exception('Errore nella richiesta API astrologica');
    }
  }
}
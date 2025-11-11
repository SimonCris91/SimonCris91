import 'dart:convert';
import 'package:http/http.dart' as http;

class LocationModulusDart {
  final String apiKey = 'LA_TUA_API_KEY_OPENCAGE';

  Future<Map<String, double>> getCoordinates(String cityName) async {
    final url = Uri.parse(
        'https://api.opencagedata.com/geocode/v1/json?q=$cityName&key=$apiKey');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final results = data['results'][0]['geometry'];
      return {
        'lat': results['lat'],
        'lon': results['lng'],
      };
    } else {
      throw Exception('Errore nella richiesta API per la città');
    }
  }

  Future<String> getCityMessage(String cityName) async {
    final coords = await getCoordinates(cityName);
    return 'La città $cityName ha coordinate lat=${coords['lat']}, lon=${coords['lon']}';
  }
}
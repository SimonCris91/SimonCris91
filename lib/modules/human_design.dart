import 'dart:convert';
import 'package:http/http.dart' as http;

class MayaModule {
  Future<Map<String, String>> getKin(String date) async {
    final url = Uri.parse('https://maya-api.com/kin?date=$date');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return {
        'kin': data['kin'] ?? 'Sconosciuto',
        'tone': data['tone'] ?? 'Sconosciuto',
        'seal': data['seal'] ?? 'Sconosciuto',
      };
    } else {
      throw Exception('Errore nella richiesta API Maya');
    }
  }
}
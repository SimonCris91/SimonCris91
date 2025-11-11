import 'dart:io';
import 'modules/maya/maya.dart';
import 'modules/human_design/human_design.dart';
import 'modules/astrology/astrology.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

const String OPENCAGE_API_KEY = '81b4df25eda547da9165158f38134c7b';

Future<Map<String, double>> getCoordinates(String city) async {
  final url = Uri.parse(
      'https://api.opencagedata.com/geocode/v1/json?q=$city&key=$OPENCAGE_API_KEY&language=it&limit=1');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    if (data['results'] != null && data['results'].length > 0) {
      final geometry = data['results'][0]['geometry'];
      return {'lat': geometry['lat'], 'lng': geometry['lng']};
    }
  }
  throw Exception('Città non trovata');
}

void main() async {
  print('--- MegaSegni AI Test Interattivo con Luogo ---\n');

  stdout.write('Giorno di nascita (1-31): ');
  int day = int.parse(stdin.readLineSync()!);

  stdout.write('Mese di nascita (1-12): ');
  int month = int.parse(stdin.readLineSync()!);

  stdout.write('Anno di nascita: ');
  int year = int.parse(stdin.readLineSync()!);

  stdout.write('Ora di nascita (0-23): ');
  int hour = int.parse(stdin.readLineSync()!);

  stdout.write('Minuti di nascita (0-59): ');
  int minute = int.parse(stdin.readLineSync()!);

  stdout.write('Città di nascita: ');
  String city = stdin.readLineSync()!;

  print('\nCalcolo coordinate...');
  Map<String, double> coords = await getCoordinates(city);

  print('Latitudine: ${coords['lat']}, Longitudine: ${coords['lng']}');

  // ====================
  // Moduli
  // ====================
  MayaModule maya = MayaModule();
  HumanDesignModule human = HumanDesignModule();
  AstrologyModule astrology = AstrologyModule();

  String kin = maya.getKin(day, month);
  String humanProfile = human.getProfileAdvanced(day, month, year, hour, minute, coords['lat']!, coords['lng']!);
  String zodiacSign = astrology.getWesternSignAdvanced(day, month, hour, minute, coords['lat']!, coords['lng']!);

  print('\n--- Risultati ---\n');
  print('Giorno Kin: $kin');
  print('Profilo Human Design: $humanProfile');
  print('Segno Zodiacale: $zodiacSign');
  print('\n--- Test completato ---');
}
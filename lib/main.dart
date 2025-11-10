import 'dart:io';
import 'modules/maya/maya.dart';
import 'modules/human_design/human_design.dart';
import 'modules/astrology/astrology.dart';

void main() {
  print('--- MegaSegni AI Test Interattivo ---\n');

  // Input giorno
  stdout.write('Inserisci giorno di nascita (1-31): ');
  int day = int.parse(stdin.readLineSync()!);

  // Input mese
  stdout.write('Inserisci mese di nascita (1-12): ');
  int month = int.parse(stdin.readLineSync()!);

  // Input anno
  stdout.write('Inserisci anno di nascita: ');
  int year = int.parse(stdin.readLineSync()!);

  print('\n--- Risultati ---\n');

  // ====================
  // Modulo Maya
  // ====================
  MayaModule maya = MayaModule();
  String kin = maya.getKin(day, month);
  print('Giorno Kin: $kin');

  // ====================
  // Modulo Human Design
  // ====================
  HumanDesignModule human = HumanDesignModule();
  String humanProfile = human.getProfile(year);
  print('Profilo Human Design: $humanProfile');

  // ====================
  // Modulo Astrologia
  // ====================
  AstrologyModule astrology = AstrologyModule();
  String zodiacSign = astrology.getWesternSign(day, month);
  print('Segno Zodiacale: $zodiacSign');

  print('\n--- Test completato ---');
}
import 'modules/maya/maya.dart';
import 'modules/human_design/human_design.dart';
import 'modules/astrology/astrology.dart';

void main() {
  print('--- MegaSegni AI Test ---\n');

  // Test Modulo Maya
MayaModule maya = MayaModule();
String kin = maya.getKin(8, 2); // esempio: 8 Febbraio
print('Giorno Kin per 8/2: $kin');

  // Test Modulo Human Design
  HumanDesignModule human = HumanDesignModule();
  String humanProfile = human.getProfile(1991);
  print('Profilo Human Design per 1991: $humanProfile');

  // Test Modulo Astrologia
  AstrologyModule astrology = AstrologyModule();
  String zodiacSign = astrology.getWesternSign(8, 2);
  print('Segno Zodiacale per 8/2: $zodiacSign');

  print('\n--- Test completato ---');
}
import 'dart:async';
import 'modules/human_design.dart';
import 'modules/astrology.dart';
import 'modules/maya.dart';
import 'modules/location_modulus.dart';

Future<void> main() async {
  // --- Human Design ---
  final human = HumanDesign();
  final humanProfile = human.getProfile("01/01/2000", "Roma", "12:00");
  print("Human Design Profile:");
  print(humanProfile);
  print("------------------------------------------------");

  // --- Astrology ---
  final astrology = AstrologyModule();
  final zodiacSign = astrology.getSign("01/01/2000");
  print("Astrological Sign:");
  print(zodiacSign);
  print("------------------------------------------------");

  // --- Maya ---
  final maya = MayaModule();
  final kin = maya.getKin("01/01/2000");
  print("Mayan Kin:");
  print(kin);
  print("------------------------------------------------");

  // --- Location Module ---
  final location = LocationModulus();
  final cityMessage = await location.getCityMessage("Roma");
  print("City Message:");
  print(cityMessage);
  print("------------------------------------------------");
}
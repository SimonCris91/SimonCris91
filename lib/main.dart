import 'package:flutter/material.dart';
import 'modules/maya/maya.dart';
import 'modules/human_design/human_design.dart';
import 'modules/astrology/astrology.dart';

void main() {
  // Esempio: inizializza i moduli
  MayaModule().run();
  HumanDesignModule().run();
  AstrologyModule().run();

  runApp(MegaSegniApp());
}

class MegaSegniApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MegaSegni AI',
      home: Scaffold(
        appBar: AppBar(title: Text('MegaSegni AI')),
        body: Center(child: Text('Benvenuto su MegaSegni AI!')),
      ),
    );
  }
}
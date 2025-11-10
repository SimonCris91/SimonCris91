import 'package:flutter/material.dart';

void main() {
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


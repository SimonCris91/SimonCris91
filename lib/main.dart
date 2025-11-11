import 'package:flutter/material.dart';
import 'package:metasegnoai/modules/astrology_module.dart';
import 'package:metasegnoai/modules/maya_calendar_module.dart';
import 'package:metasegnoai/modules/human_design_module.dart';
import 'package:geocoding/geocoding.dart'; // Conversione città -> lat/lon

void main() {
  runApp(MetaSegnoAITest());
}

class MetaSegnoAITest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MetaSegnoAI Test',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TestInputPage(),
    );
  }
}

class TestInputPage extends StatefulWidget {
  @override
  _TestInputPageState createState() => _TestInputPageState();
}

class _TestInputPageState extends State<TestInputPage> {
  final _formKey = GlobalKey<FormState>();

  String name = 'Simone';
  String dateOfBirth = '1991-02-08';
  String timeOfBirth = '12:00';
  String cityOfBirth = 'Olbia';

  String resultHumanDesign = '';
  String resultAstrology = '';
  String resultMaya = '';

  Future<void> calculateProfile() async {
    try {
      // Converti città in coordinate
      List<Location> locations = await locationFromAddress(cityOfBirth);
      double latitude = locations.first.latitude;
      double longitude = locations.first.longitude;

      // Calcola i profili dai moduli
      resultHumanDesign = HumanDesignModule.getProfile(dateOfBirth, timeOfBirth, latitude, longitude);
      resultAstrology = AstrologyModule.getZodiacSign(dateOfBirth, timeOfBirth, latitude, longitude);
      resultMaya = MayaCalendarModule.getKin(dateOfBirth);

      setState(() {});
    } catch (e) {
      setState(() {
        resultHumanDesign = 'Errore: $e';
        resultAstrology = 'Errore: $e';
        resultMaya = 'Errore: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MetaSegnoAI Test')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextFormField(
              initialValue: name,
              decoration: InputDecoration(labelText: 'Nome'),
              onChanged: (val) => name = val,
            ),
            TextFormField(
              initialValue: dateOfBirth,
              decoration: InputDecoration(labelText: 'Data di nascita (YYYY-MM-DD)'),
              onChanged: (val) => dateOfBirth = val,
            ),
            TextFormField(
              initialValue: timeOfBirth,
              decoration: InputDecoration(labelText: 'Ora di nascita (HH:MM)'),
              onChanged: (val) => timeOfBirth = val,
            ),
            TextFormField(
              initialValue: cityOfBirth,
              decoration: InputDecoration(labelText: 'Città di nascita'),
              onChanged: (val) => cityOfBirth = val,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateProfile,
              child: Text('Calcola Profilo'),
            ),
            SizedBox(height: 20),
            Text('Human Design: $resultHumanDesign'),
            Text('Zodiac Sign: $resultAstrology'),
            Text('Maya Kin: $resultMaya'),
          ],
        ),
      ),
    );
  }
}
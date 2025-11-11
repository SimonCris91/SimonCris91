class MayaModule {
  final List<String> nahuales = [
    "Imix", "Ik'", "Ak'b'al", "K'an", "Chikchan",
    "Kimi", "Manik'", "Lamat", "Muluk", "Ok",
    "Chuwen", "Eb'", "B'en", "Ix", "Men",
    "Kib'", "Kab'an", "Etz'nab'", "Kawak", "Ajaw"
  ];

  final List<int> trecenas = List.generate(13, (i) => i + 1);

  String calculateSign(int day, int month) {
    int index = ((month - 1) * 30 + day) % 20;
    return nahuales[index];
  }

  int calculateTrecena(int day, int month) {
    int number = ((month - 1) * 30 + day) % 13;
    return number == 0 ? 13 : number;
  }

  String getKin(int day, int month) {
    String sign = calculateSign(day, month);
    int number = calculateTrecena(day, month);
    return "$number $sign";
  }
}
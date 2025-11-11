class HumanDesignModule {
  String getProfile(int day, int month, int year) {
    // Esempio semplificato basato sul giorno
    int val = (day + month + year) % 4;
    switch (val) {
      case 0:
        return "Manifestor";
      case 1:
        return "Generator";
      case 2:
        return "Projector";
      case 3:
        return "Reflector";
      default:
        return "Profilo Generico";
    }
  }
}
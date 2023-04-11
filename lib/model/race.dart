enum Race {
  elf,
  human,
  dwarf,
  halfling;

  @override
  String toString() {
    switch (this) {
      case Race.elf:
        return "Ельф";
      case Race.human:
        return "Людина";
      case Race.dwarf:
        return "Гном";
      case Race.halfling:
        return "Дрібнолюд";
    }
  }
}
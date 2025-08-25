enum StatutEnvoiEnum {
  enCours,
  termine,
  erreur,
}

extension StatutEnvoiEnumX on StatutEnvoiEnum {
  static StatutEnvoiEnum fromString(String value) {
    switch (value) {
      case 'enCours':
        return StatutEnvoiEnum.enCours;
      case 'termine':
        return StatutEnvoiEnum.termine;
      case 'erreur':
        return StatutEnvoiEnum.erreur;
      default:
        throw Exception('StatutEnvoiEnum not found');
    }
  }
}

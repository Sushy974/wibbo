/// Normalise les caractères spéciaux pour éviter les problèmes d'encodage
String normalizeSpecialCharacters(String input) {
  return input
      .replaceAll('ï', 'i') // Taïbit -> Taibit
      .replaceAll('ï', 'i') // Double vérification
      .replaceAll('é', 'e') // café -> cafe
      .replaceAll('è', 'e') // père -> pere
      .replaceAll('à', 'a') // là -> la
      .replaceAll('â', 'a') // âge -> age
      .replaceAll('ê', 'e') // fête -> fete
      .replaceAll('ô', 'o') // hôtel -> hotel
      .replaceAll('û', 'u') // sûr -> sur
      .replaceAll('ù', 'u') // où -> ou
      .replaceAll('ç', 'c') // français -> francais
      .replaceAll('ñ', 'n') // español -> espanol
      .replaceAll('ü', 'u') // über -> uber
      .replaceAll('ö', 'o') // köln -> koln
      .replaceAll('ä', 'a') // mädchen -> madchen
      .replaceAll('ß', 'ss') // straße -> strasse
      .replaceAll('æ', 'ae') // encyclopædia -> encyclopaedia
      .replaceAll('œ', 'oe') // cœur -> coeur
      .replaceAll('å', 'a') // ångström -> angstrom
      .replaceAll('ø', 'o') // søren -> soren
      .replaceAll('ł', 'l') // łódź -> lodz
      .replaceAll('ń', 'n') // gdańsk -> gdansk
      .replaceAll('ś', 's') // święto -> swieto
      .replaceAll('ź', 'z') // źle -> zle
      .replaceAll('ż', 'z') // żółty -> zolty
      .replaceAll('ć', 'c') // ćma -> cma
      .replaceAll('ę', 'e') // język -> jezyk
      .replaceAll('ą', 'a'); // mąż -> maz
}

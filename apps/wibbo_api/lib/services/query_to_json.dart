// ignore_for_file: omit_local_variable_types, public_member_api_docs, unnecessary_cast, inference_failure_on_collection_literal, prefer_final_in_for_each

Map<String, dynamic> queryToJson(String query) {
  final Map<String, dynamic> result = {};

  // Diviser la requête en paramètres individuels
  final List<String> params = query.split('&');

  for (String param in params) {
    if (param.isEmpty) continue;

    // Diviser chaque paramètre en clé et valeur
    final int equalIndex = param.indexOf('=');
    if (equalIndex == -1) continue;

    String key = param.substring(0, equalIndex);
    String value = param.substring(equalIndex + 1);

    // Décoder les caractères spéciaux
    key = Uri.decodeComponent(key);
    value = Uri.decodeComponent(value).replaceAll('+', ' ');

    // Gérer les tableaux (ex: line_items[0][product_id])
    if (key.contains('[') && key.contains(']')) {
      _parseArrayParameter(result, key, value);
    } else {
      // Paramètres simples
      result[key] = _convertValue(value);
    }
  }

  return result;
}

void _parseArrayParameter(
    Map<String, dynamic> result, String key, String value) {
  // Extraire le nom de base du tableau (ex: "line_items" depuis "line_items[0][product_id]")
  final int firstBracketIndex = key.indexOf('[');
  final String baseKey = key.substring(0, firstBracketIndex);

  // Extraire les indices et la clé finale
  final String remainingKey = key.substring(firstBracketIndex);

  // Parser les indices du tableau
  final List<String> parts = remainingKey.split('[');
  final List<String> indices = [];

  for (int i = 1; i < parts.length; i++) {
    final String part = parts[i];
    if (part.endsWith(']')) {
      indices.add(part.substring(0, part.length - 1));
    }
  }

  // Initialiser la structure si nécessaire
  if (!result.containsKey(baseKey)) {
    // Vérifier si le premier indice est un nombre pour déterminer le type
    final int? firstIndex = int.tryParse(indices[0]);
    if (firstIndex != null) {
      result[baseKey] = []; // Tableau
    } else {
      result[baseKey] = <String, dynamic>{}; // Objet
    }
  }

  // Naviguer dans la structure
  dynamic current = result[baseKey];

  // Si nous n'avons qu'un seul indice, vérifier si c'est un nombre (tableau simple) ou une chaîne (objet imbriqué)
  if (indices.length == 1) {
    final int? index = int.tryParse(indices[0]);

    // Si l'indice est un nombre, c'est un tableau simple
    if (index != null) {
      // S'assurer que l'index existe dans le tableau
      while ((current as List<dynamic>).length <= index) {
        (current as List<dynamic>).add(null);
      }

      (current as List<dynamic>)[index] = _convertValue(value);
      return;
    } else {
      // Si l'indice n'est pas un nombre, c'est un objet imbriqué
      final String key = indices[0];
      (current as Map<String, dynamic>)[key] = _convertValue(value);
      return;
    }
  }

  // Sinon, c'est un tableau d'objets imbriqués
  // Traverser les indices pour atteindre la position finale
  for (int i = 0; i < indices.length - 1; i++) {
    final int index = int.tryParse(indices[i]) ?? 0;

    // Vérifier le type de current et agir en conséquence
    if (current is List<dynamic>) {
      // S'assurer que l'index existe dans le tableau
      while (current.length <= index) {
        current.add(<String, dynamic>{});
      }

      if (current[index] == null) {
        current[index] = <String, dynamic>{};
      }

      current = current[index];
    } else if (current is Map<String, dynamic>) {
      // Si current est un Map, on ne peut pas utiliser un index numérique
      // On doit créer une structure différente
      final String key = indices[i];
      if (!current.containsKey(key)) {
        current[key] = <String, dynamic>{};
      }
      current = current[key];
    }
  }

  // Définir la valeur finale
  final String finalKey = indices.last;
  if (current is Map<String, dynamic>) {
    current[finalKey] = _convertValue(value);
  } else if (current is List<dynamic>) {
    final int? index = int.tryParse(finalKey);
    if (index != null) {
      while (current.length <= index) {
        current.add(null);
      }
      current[index] = _convertValue(value);
    }
  }
}

dynamic _convertValue(String value) {
  // Convertir les valeurs selon leur type
  if (value.isEmpty) return '';

  // Convertir les valeurs booléennes
  if (value == 'true') return true;
  if (value == 'false') return false;

  // Convertir les dates (format YYYY-MM-DD)
  if (RegExp(r'^\d{4}-\d{2}-\d{2}$').hasMatch(value)) {
    return value; // Garder comme string pour l'instant
  }

  // Convertir les dates avec heure (format YYYY-MM-DD HH:MM:SS)
  if (RegExp(r'^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}$').hasMatch(value)) {
    return value; // Garder comme string pour l'instant
  }

  // Essayer de convertir en nombre seulement si c'est un nombre simple
  // Éviter de convertir les codes-barres ou autres identifiants longs
  if (value.length <= 10) {
    final double? doubleValue = double.tryParse(value);
    if (doubleValue != null) {
      return doubleValue;
    }

    final int? intValue = int.tryParse(value);
    if (intValue != null) {
      return intValue;
    }
  }

  // Par défaut, retourner comme string
  return value;
}

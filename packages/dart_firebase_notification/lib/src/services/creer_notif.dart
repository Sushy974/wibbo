String creerContenu(String text, Map<String, dynamic> data) {
  return data.entries.fold(text, (currentText, entry) {
    return currentText.replaceAll('{{${entry.key}}}', entry.value as String);
  });
}

String creerTitre(String text, Map<String, dynamic> data) {
  return data.entries.fold(text, (currentText, entry) {
    return currentText.replaceAll('{{${entry.key}}}', entry.value as String);
  });
}

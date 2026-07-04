String phonToEmail(String phon) {
  String cleanPhon = phon.replaceAll(RegExp(r'[^0-9]'), '');
  return '$cleanPhon@dullany.com';
}

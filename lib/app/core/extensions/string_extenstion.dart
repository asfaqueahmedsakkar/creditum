extension DateExtension on String {
  toCamellaCase(
          {String characterToReplace = "_",
          String characterToReplaceWith = ""}) =>
      split(characterToReplace)
          .map((e) => "${e[0].toUpperCase()}${e.substring(1)}")
          .join(characterToReplaceWith);

  String currencyConvertor() {
    String currencyValue = "";

    for (int i = 0; i < length; i++) {
      currencyValue = "${this[length-i-1]}$currencyValue";
      if (i != 0 && i != length - 1 && i % 3 == 2) {
        currencyValue = ",$currencyValue";
      }
    }

    return currencyValue;
  }
}

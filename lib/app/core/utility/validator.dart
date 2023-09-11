class Validator {
  static String supportedCharacters = '_, @, .';

  static bool validateEmail(String text) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(text);
  }

  static bool alphaNumeric(String text) {
    return RegExp(r"^[a-zA-Z0-9]+$").hasMatch(text);
  }

  static bool numeric(String text) {
    return RegExp(r"^[0-9]+$").hasMatch(text);
  }

  static bool alphabetic(String text) {
    return RegExp(r"^[a-zA-Z]+$").hasMatch(text);
  }

  static bool notEmptyAndNull(String? text) {
    return text != null && text.isNotEmpty;
  }

  static bool bothAlphabeticAndNumeric(String text) {
    return alphabetic(text) && numeric(text);
  }

  static bool alphaNumericAndSpecialCharacter(String text) {
    return RegExp(r'^[a-zA-Z0-9_@.]+$').hasMatch(text);
  }

  static bool length(String text, {int? min, int? max}) {
    bool valid = true;

    if (max != null) {
      valid = text.length <= max;
    }
    if (min != null) {
      valid = text.length >= min;
    }

    return valid;
  }

  static bool notEmpty(String text) {
    return text.isNotEmpty;
  }

  static bool notNull(var text) {
    return text != null;
  }

  static bool isNotNullAndIsMap(var data) =>
      data != null && data is Map<String, dynamic> && data != Null;

  static bool isNotNullAndIsList(var data) => data != null && data is List;
}

import 'package:flutter/services.dart';

class TextFormatter {
  AllowedTextType? allowedType;
  int? max;
  int? min;
  List<String>? characters;

  TextFormatter.allowType(this.allowedType);

  TextFormatter.range({this.max, this.min});

  TextFormatter.allowCharacters(this.characters);

  TextInputFormatter get formatter {
    if (allowedType != null) {
      switch (allowedType!) {
        case AllowedTextType.numeric:
          return FilteringTextInputFormatter.allow(RegExp(r"\d"));
        case AllowedTextType.alphabetic:
          return FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z].*"));
        case AllowedTextType.alphaNumeric:
          return FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z\d].*"));
        case AllowedTextType.capitalLatter:
          return FilteringTextInputFormatter.allow(RegExp(r"[A-Z].*"));
        case AllowedTextType.smallLatter:
          return FilteringTextInputFormatter.allow(RegExp(r"[a-z].*"));
        case AllowedTextType.symbolOnly:
          return FilteringTextInputFormatter.allow(RegExp(r"\d.*\.\d.*"));
        case AllowedTextType.decimalValue:
          return FilteringTextInputFormatter.allow(RegExp(r"\d.*\.\d.*"));
        case AllowedTextType.noWhiteSpace:
          return FilteringTextInputFormatter.allow(RegExp(r"\S*"));
      }
    }

    if(characters!=null){
      return FilteringTextInputFormatter.allow(RegExp(r"\S*"));
    }

    return TextInputFormatter.withFunction((oldValue, newValue) => newValue);
  }
}

enum AllowedTextType {
  numeric,
  alphabetic,
  alphaNumeric,
  capitalLatter,
  smallLatter,
  symbolOnly,
  decimalValue,
  noWhiteSpace,
}

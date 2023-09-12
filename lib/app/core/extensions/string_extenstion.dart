extension DateExtension on String {
  toCamellaCase(
          {String characterToReplace = "_",
          String characterToReplaceWith = ""}) =>
      split(characterToReplace)
          .map((e) => "${e[0].toUpperCase()}${e.substring(1)}")
          .join(characterToReplaceWith);
}

extension Modification on String {
  String deletePrefix(String prefix) {
    if (startsWith(prefix)) {
      return substring(prefix.length);
    }
    return this;
  }

  String deleteInfix(String infix) {
    if (length < 3) {
      return this;
    }
    return "${this[0]}${substring(1, length - 1).replaceAll(infix, "")}${this[length - 1]}";
  }

  String removeSuffix(String suffix) {
    var index = length;
    final n = suffix.length;
    while (index - n >= 0) {
      if (substring(index - n, index) == suffix) {
        index -= n;
      } else {
        break;
      }
    }
    if (index == length) {
      return this;
    }
    return substring(0, index);
  }
}

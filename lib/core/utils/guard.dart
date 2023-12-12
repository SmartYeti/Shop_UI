class Guard {
  static String? againstNull(dynamic val, String name) {
    if (val == null) {
      return '$name is undifined';
    }
    return null;
  }

 

  static String? againstEmptyString(dynamic val, String name) {
    final String? isNull = againstNull(val, name);

    if (isNull != null) {
      return isNull;
    }
// -----
    if (val is! String) {
      return '$name is not a String';
    }
// ------
    if (val.isEmpty) {
      return '$name is Empty';
    }
    return null;
  }

  static String? againstInvalidEmail(String? val, String name) {
    final String? isEmpty = againstEmptyString(val, name);
    if (isEmpty != null) {
      return isEmpty;
    }
    final RegExp regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if (!regExp.hasMatch(val!)) {
      return '$name is invalid';
    }

    return null;
  }

  static String? againstNotMatch(String? val, String? reference, String name) {
    final String? isNull = againstNull(val, name);
    if (isNull != null) {
      return isNull;
    }

    final String? isEmpty = againstEmptyString(val, name);
    if (isEmpty != null) {
      return isEmpty;
    }

    if (val != reference) {
      return '$name does not match';
    }

    return null;
  }
}

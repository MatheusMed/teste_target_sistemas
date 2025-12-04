class ValidatorForm {
  static String? validatorGenerico({
    required String value,
    required String textInfo,
  }) {
    if (value.isEmpty) {
      return value;
    }
    return null;
  }
}

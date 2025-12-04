class Validators {
  static String? validateUser(String? value) {
    if (value == null || value.isEmpty) {
      return "Digite seu usuário";
    }

    if (value.length < 3) {
      return "O usuário deve ter ao menos 3 caracteres";
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Digite sua senha";
    }

    if (value.length < 6) {
      return "A senha deve ter pelo menos 6 caracteres";
    }

    final hasUppercase = RegExp(r'[A-Z]').hasMatch(value);
    if (!hasUppercase) {
      return "A senha deve ter ao menos 1 letra maiúscula";
    }

    return null;
  }
}

import 'dart:developer';

import 'package:mobx/mobx.dart';
import 'package:teste_target_sistemas/taskApp/core/dao/user_dao.dart';
import 'package:teste_target_sistemas/taskApp/core/utils/validators.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  final UserDao userDao = UserDao();

  @observable
  String user = '';

  @observable
  String password = '';

  @observable
  bool showPassword = false;

  @observable
  bool isLoading = false;

  @observable
  bool userTouched = false;

  @observable
  bool passwordTouched = false;

  @computed
  String? get userError => userTouched ? Validators.validateUser(user) : null;

  @computed
  String? get passwordError =>
      passwordTouched ? Validators.validatePassword(password) : null;

  @computed
  bool get isValid =>
      Validators.validateUser(user) == null &&
      Validators.validatePassword(password) == null;

  @action
  void setUser(String value) {
    user = value;
    userTouched = true;
  }

  @action
  void setPassword(String value) {
    password = value;
    passwordTouched = true;
  }

  @action
  void toggleShowPassword() => showPassword = !showPassword;

  @action
  Future<bool> login() async {
    userTouched = true;
    passwordTouched = true;

    log(user);
    log(password);

    if (!isValid) return false;

    isLoading = true;
    await Future.delayed(const Duration(seconds: 1));
    await userDao.saveUser(nome: user, senha: password);
    isLoading = false;
    return true;
  }
}

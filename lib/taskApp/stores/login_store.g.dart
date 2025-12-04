// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on _LoginStoreBase, Store {
  Computed<String?>? _$userErrorComputed;

  @override
  String? get userError => (_$userErrorComputed ??= Computed<String?>(
    () => super.userError,
    name: '_LoginStoreBase.userError',
  )).value;
  Computed<String?>? _$passwordErrorComputed;

  @override
  String? get passwordError => (_$passwordErrorComputed ??= Computed<String?>(
    () => super.passwordError,
    name: '_LoginStoreBase.passwordError',
  )).value;
  Computed<bool>? _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??= Computed<bool>(
    () => super.isValid,
    name: '_LoginStoreBase.isValid',
  )).value;

  late final _$userAtom = Atom(name: '_LoginStoreBase.user', context: context);

  @override
  String get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(String value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$passwordAtom = Atom(
    name: '_LoginStoreBase.password',
    context: context,
  );

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$showPasswordAtom = Atom(
    name: '_LoginStoreBase.showPassword',
    context: context,
  );

  @override
  bool get showPassword {
    _$showPasswordAtom.reportRead();
    return super.showPassword;
  }

  @override
  set showPassword(bool value) {
    _$showPasswordAtom.reportWrite(value, super.showPassword, () {
      super.showPassword = value;
    });
  }

  late final _$isLoadingAtom = Atom(
    name: '_LoginStoreBase.isLoading',
    context: context,
  );

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$userTouchedAtom = Atom(
    name: '_LoginStoreBase.userTouched',
    context: context,
  );

  @override
  bool get userTouched {
    _$userTouchedAtom.reportRead();
    return super.userTouched;
  }

  @override
  set userTouched(bool value) {
    _$userTouchedAtom.reportWrite(value, super.userTouched, () {
      super.userTouched = value;
    });
  }

  late final _$passwordTouchedAtom = Atom(
    name: '_LoginStoreBase.passwordTouched',
    context: context,
  );

  @override
  bool get passwordTouched {
    _$passwordTouchedAtom.reportRead();
    return super.passwordTouched;
  }

  @override
  set passwordTouched(bool value) {
    _$passwordTouchedAtom.reportWrite(value, super.passwordTouched, () {
      super.passwordTouched = value;
    });
  }

  late final _$loginAsyncAction = AsyncAction(
    '_LoginStoreBase.login',
    context: context,
  );

  @override
  Future<bool> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  late final _$_LoginStoreBaseActionController = ActionController(
    name: '_LoginStoreBase',
    context: context,
  );

  @override
  void setUser(String value) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
      name: '_LoginStoreBase.setUser',
    );
    try {
      return super.setUser(value);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
      name: '_LoginStoreBase.setPassword',
    );
    try {
      return super.setPassword(value);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleShowPassword() {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
      name: '_LoginStoreBase.toggleShowPassword',
    );
    try {
      return super.toggleShowPassword();
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
password: ${password},
showPassword: ${showPassword},
isLoading: ${isLoading},
userTouched: ${userTouched},
passwordTouched: ${passwordTouched},
userError: ${userError},
passwordError: ${passwordError},
isValid: ${isValid}
    ''';
  }
}

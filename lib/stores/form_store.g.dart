// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FormStore on _FormStore, Store {
  Computed<String?>? _$passwordErrorComputed;

  @override
  String? get passwordError =>
      (_$passwordErrorComputed ??= Computed<String?>(() => super.passwordError,
              name: '_FormStore.passwordError'))
          .value;
  Computed<bool>? _$isValidUsernameFieldComputed;

  @override
  bool get isValidUsernameField => (_$isValidUsernameFieldComputed ??=
          Computed<bool>(() => super.isValidUsernameField,
              name: '_FormStore.isValidUsernameField'))
      .value;
  Computed<bool>? _$isValidPasswordFieldComputed;

  @override
  bool get isValidPasswordField => (_$isValidPasswordFieldComputed ??=
          Computed<bool>(() => super.isValidPasswordField,
              name: '_FormStore.isValidPasswordField'))
      .value;
  Computed<String?>? _$loginErrorComputed;

  @override
  String? get loginError =>
      (_$loginErrorComputed ??= Computed<String?>(() => super.loginError,
              name: '_FormStore.loginError'))
          .value;

  late final _$usernameAtom =
      Atom(name: '_FormStore.username', context: context);

  @override
  String get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_FormStore.password', context: context);

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

  late final _$_FormStoreActionController =
      ActionController(name: '_FormStore', context: context);

  @override
  void setUsername(String value) {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.setUsername');
    try {
      return super.setUsername(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
username: ${username},
password: ${password},
passwordError: ${passwordError},
isValidUsernameField: ${isValidUsernameField},
isValidPasswordField: ${isValidPasswordField},
loginError: ${loginError}
    ''';
  }
}

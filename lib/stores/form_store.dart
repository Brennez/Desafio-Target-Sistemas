import 'package:mobx/mobx.dart';

part 'form_store.g.dart';

class FormStore = _FormStore with _$FormStore;

abstract class _FormStore with Store {
  @observable
  String username = '';

  @observable
  String password = '';

  @computed
  String? get passwordError {
    if (password.isEmpty) {
      return 'A senha não pode estar vazia';
    } else if (password.length < 2) {
      return 'A senha deve ter pelo menos dois caracteres';
    } else if (password.length > 20) {
      return 'A senha não pode ter mais de 20 caracteres';
    } else if (password.endsWith(" ")) {
      return 'A senha não pode terminar com espaço';
    } else if (!isValidPasswordField) {
      return 'A senha só pode conter letras e números';
    }
    return null;
  }

  @computed
  bool get isValidUsernameField {
    return username.length >= 2 &&
        username.length <= 20 &&
        !username.endsWith(" ");
  }

  @computed
  bool get isValidPasswordField {
    return password.length >= 2 &&
        RegExp(r'^[a-zA-Z0-9\s]+$').hasMatch(password) &&
        password.length <= 20 &&
        !password.endsWith(" ");
  }

  @computed
  String? get loginError {
    if (username.isEmpty) {
      return 'Usuário não pode estar vazio';
    } else if (username.length > 20) {
      return 'O usuário não pode ter mais de 20 caracteres';
    } else if (username.endsWith(" ")) {
      return 'O usuário não pode terminar com espaço';
    }
    return null;
  }

  @action
  void setUsername(String value) {
    username = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }
}

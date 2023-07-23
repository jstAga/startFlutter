import 'package:flutter/material.dart';
import 'package:start_flutter/ui/others/mvvm_counter/ui/data_providers/auth_api_data_provider/auth_api_provider.dart';
import 'package:start_flutter/ui/others/mvvm_counter/ui/screens/mvvm_counter_auth/mvvm_counter_auth_repository/mvvm_counter_auth_repository.dart';

enum MvvmCounterAuthButtonState { canSubmit, authInProcess, disabled }

class MvvmCounterAuthViewModelState {
  final String authErrorTitle;
  final String login;
  final String password;
  final MvvmCounterAuthButtonState authButtonState;

  MvvmCounterAuthViewModelState({
    this.authErrorTitle = "",
    this.login = "",
    this.password = "",
    this.authButtonState = MvvmCounterAuthButtonState.disabled,
  });

  MvvmCounterAuthViewModelState copyWith({
    String? authErrorTitle,
    String? login,
    String? password,
    MvvmCounterAuthButtonState? authButtonState,
    bool? isAuthInProcess,
  }) {
    return MvvmCounterAuthViewModelState(
      authErrorTitle: authErrorTitle ?? this.authErrorTitle,
      login: login ?? this.login,
      password: password ?? this.password,
      authButtonState: authButtonState ?? this.authButtonState,
    );
  }
}

class MvvmCounterAuthViewModel extends ChangeNotifier {
  final repository = MvvmCounterAuthRepository();
  var _state = MvvmCounterAuthViewModelState();

  MvvmCounterAuthViewModelState get state => _state;

  void changeLogin(String value) {
    if (_state.login == value) return;
    _state.copyWith(login: value);
    notifyListeners();
  }

  void changePassword(String value) {
    if (_state.password == value) return;
    _state.copyWith(password: value);
    notifyListeners();
  }

  Future<void> onAuthButtonPressed() async {
    final login = _state.login;
    final password = _state.password;
    if (login.isEmpty || password.isEmpty) return;
    try {
      await repository.auth(login, password);
    } on AuthApiProviderIncorrectLoginDataError {
      _state = _state.copyWith(authErrorTitle: "Incorrect login or password");
    } catch (e) {
      _state = _state.copyWith(authErrorTitle: "Unknown error");
    } finally {
      notifyListeners();
    }
  }
}

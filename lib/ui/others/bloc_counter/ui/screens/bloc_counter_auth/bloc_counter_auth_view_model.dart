import 'package:flutter/material.dart';
import 'package:start_flutter/ui/main_navigation/main_navigation.dart';
import 'package:start_flutter/ui/others/bloc_counter/ui/screens/bloc_counter_auth/mvvm_counter_auth_repository/mvvm_counter_auth_repository.dart';
import 'package:start_flutter/ui/others/mvvm_counter/ui/data_providers/auth_api_data_provider/auth_api_provider.dart';

enum BlocCounterAuthButtonState { canSubmit, authInProcess, disabled }

class MvvmCounterAuthViewModelState {
  final String authErrorTitle;
  final String login;
  final String password;
  final bool isAuthInProcess;

  BlocCounterAuthButtonState get authButtonState {
    if (isAuthInProcess) {
      return BlocCounterAuthButtonState.authInProcess;
    } else if (login.isNotEmpty && password.isNotEmpty) {
      return BlocCounterAuthButtonState.canSubmit;
    } else {
      return BlocCounterAuthButtonState.disabled;
    }
  }

  MvvmCounterAuthViewModelState(
      {this.authErrorTitle = "",
      this.login = "",
      this.password = "",
      this.isAuthInProcess = false});

  MvvmCounterAuthViewModelState copyWith({
    String? authErrorTitle,
    String? login,
    String? password,
    bool? isAuthInProcess,
  }) {
    return MvvmCounterAuthViewModelState(
      authErrorTitle: authErrorTitle ?? this.authErrorTitle,
      login: login ?? this.login,
      password: password ?? this.password,
      isAuthInProcess: isAuthInProcess ?? this.isAuthInProcess,
    );
  }
}

class CounterAuthBloc extends ChangeNotifier {
  final repository = BlocCounterAuthRepository();
  var _state = MvvmCounterAuthViewModelState();

  MvvmCounterAuthViewModelState get state => _state;

  void changeLogin(String value) {
    if (_state.login == value) return;
    _state = _state.copyWith(login: value);
    notifyListeners();
  }

  void changePassword(String value) {
    if (_state.password == value) return;
    _state = _state.copyWith(password: value);
    notifyListeners();
  }

  Future<void> onAuthButtonPressed(BuildContext context) async {
    final login = _state.login;
    final password = _state.password;
    if (login.isEmpty || password.isEmpty) return;

    _state = _state.copyWith(authErrorTitle: "", isAuthInProcess: true);
    notifyListeners();
    try {
      await repository.auth(login, password);
      _state = _state.copyWith(isAuthInProcess: false);
    } on AuthApiProviderIncorrectLoginDataError {
      _state = _state.copyWith(
          authErrorTitle: "Incorrect login or password",
          isAuthInProcess: false);
    } catch (e) {
      _state = _state.copyWith(
          authErrorTitle: "Unknown error", isAuthInProcess: false);
    }
    notifyListeners();
    Navigator.pushNamedAndRemoveUntil(
        context, MainNavigationRoutesNames.mvvmCounter, (route) => false);
  }
}

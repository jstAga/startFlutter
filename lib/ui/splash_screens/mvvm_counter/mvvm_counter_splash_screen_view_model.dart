import 'package:flutter/material.dart';
import 'package:start_flutter/ui/main_navigation/main_navigation.dart';
import 'package:start_flutter/ui/others/bloc_counter/ui/screens/bloc_counter_auth/mvvm_counter_auth_repository/mvvm_counter_auth_repository.dart';

class SplashScreenViewModel {
  final _authRepository = BlocCounterAuthRepository();
  BuildContext context;

  SplashScreenViewModel(this.context) {
    initialization();
  }

  Future<void> initialization() async {
    final isAuth = await _authRepository.checkAuth();
    if (isAuth) {
      _toHomeScreen();
    } else {
      _toAuthScreen();
    }
  }

  void _toAuthScreen() {
    Navigator.pushNamedAndRemoveUntil(
        context, MainNavigationRoutesNames.mvvmCounterAuth, (route) => false);
  }

  void _toHomeScreen() {
    Navigator.pushNamedAndRemoveUntil(
        context, MainNavigationRoutesNames.mvvmCounter, (route) => false);
  }
}

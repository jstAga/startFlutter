import 'package:flutter/material.dart';
import 'package:start_flutter/ui/main_navigation/main_navigation.dart';
import 'package:start_flutter/ui/others/mvvm_counter/ui/screens/mvvm_counter_auth/mvvm_counter_auth_repository/mvvm_counter_auth_repository.dart';

class BlocCounterSplashScreenViewModel {
  final _authRepository = MvvmCounterAuthRepository();
  BuildContext context;

  BlocCounterSplashScreenViewModel(this.context) {
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

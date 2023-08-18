import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:start_flutter/ui/splash_screens/mvvm_counter/mvvm_counter_splash_screen_view_model.dart';

class MvvmCounterSplashScreenWidget extends StatelessWidget {
  const MvvmCounterSplashScreenWidget({super.key});

  static Widget create() {
    return Provider(
        lazy: false,
        create: (context) => SplashScreenViewModel(context),
        child: const MvvmCounterSplashScreenWidget());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator(),),);
  }
}

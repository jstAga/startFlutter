import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:start_flutter/ui/splash_screen/splash_screen_view_model.dart';

class SplashScreenWidget extends StatelessWidget {
  const SplashScreenWidget({super.key});

  static Widget create() {
    return Provider(
        lazy: false,
        create: (context) => SplashScreenViewModel(context),
        child: const SplashScreenWidget());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator(),),);
  }
}

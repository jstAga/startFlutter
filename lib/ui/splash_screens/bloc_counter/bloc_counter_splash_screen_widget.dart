import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:start_flutter/ui/splash_screens/bloc_counter/bloc_counter_splash_screen_view_model.dart';

class BlocCounterSplashScreenWidget extends StatelessWidget {
  const BlocCounterSplashScreenWidget({super.key});

  static Widget create() {
    return Provider(
        lazy: false,
        create: (context) => BlocCounterSplashScreenViewModel(context),
        child: const BlocCounterSplashScreenWidget());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator(),),);
  }
}

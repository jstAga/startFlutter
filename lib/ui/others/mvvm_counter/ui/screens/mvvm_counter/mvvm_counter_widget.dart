import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:start_flutter/ui/others/mvvm_counter/ui/screens/mvvm_counter/mvvm_counter_view_model.dart';

class MvvmCounterWidget extends StatelessWidget {
  const MvvmCounterWidget({super.key});

  static Widget create() {
    return ChangeNotifierProvider(
        create: (_) => MvvmCounterViewModel(), child: MvvmCounterWidget());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _Title(),
              _BtnValueInc(),
              _BtnValueDec(),
            ],
          ),
        ),
      ),
    );
  }
}

class _BtnValueInc extends StatelessWidget {
  const _BtnValueInc();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<MvvmCounterViewModel>();
    return ElevatedButton(
        onPressed: () => viewModel.onIncrementBtnPressed(),
        child: const Text("+"));
  }
}

class _BtnValueDec extends StatelessWidget {
  const _BtnValueDec();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<MvvmCounterViewModel>();
    return ElevatedButton(
        onPressed: () => viewModel.onDecrementBtnPressed(),
        child: const Text("+"));
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    final value =
        context.select((MvvmCounterViewModel vm) => vm.state.ageTitle);
    return Text(value);
  }
}

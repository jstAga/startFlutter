import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:start_flutter/ui/others/bloc_counter/ui/screens/bloc_counter_auth/bloc_counter_auth_view_model.dart';
import 'package:start_flutter/ui/others/mvvm_counter/ui/screens/mvvm_counter_auth/mvvm_counter_auth_view_model.dart';

class BlocCounterAuthWidget extends StatelessWidget {
  const BlocCounterAuthWidget({super.key});

  static Widget create() {
    return ChangeNotifierProvider(
        create: (_) => CounterAuthBloc(),
        child: const BlocCounterAuthWidget());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _ErrorTitle(),
              _Login(),
              SizedBox(height: 20),
              _Password(),
              SizedBox(height: 20),
              _AuthButton(),
            ],
          ),
        ),
      )),
    );
  }
}

class _AuthButton extends StatelessWidget {
  const _AuthButton();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<MvvmCounterAuthViewModel>();
    final authButtonState = context.select(
        (MvvmCounterAuthViewModel value) => value.state.authButtonState);
    final onPressed = authButtonState == MvvmCounterAuthButtonState.canSubmit
        ? viewModel.onAuthButtonPressed
        : null;
    final child = authButtonState == MvvmCounterAuthButtonState.authInProcess
        ? const CircularProgressIndicator()
        : const Text("Log in");
    return ElevatedButton(
        onPressed: () => onPressed?.call(context), child: child);
  }
}

class _ErrorTitle extends StatelessWidget {
  const _ErrorTitle();

  @override
  Widget build(BuildContext context) {
    final authErrorTitle = context
        .select((MvvmCounterAuthViewModel value) => value.state.authErrorTitle);
    return Text(authErrorTitle,
        style: const TextStyle(color: Colors.red, fontSize: 20));
  }
}

class _Password extends StatelessWidget {
  const _Password();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<MvvmCounterAuthViewModel>();
    return TextField(
      decoration: const InputDecoration(
          label: Text("Password"), border: OutlineInputBorder()),
      onChanged: viewModel.changePassword,
    );
  }
}

class _Login extends StatelessWidget {
  const _Login();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<MvvmCounterAuthViewModel>();
    return TextField(
      decoration: const InputDecoration(
          label: Text("Login"), border: OutlineInputBorder()),
      onChanged: viewModel.changeLogin,
    );
  }
}

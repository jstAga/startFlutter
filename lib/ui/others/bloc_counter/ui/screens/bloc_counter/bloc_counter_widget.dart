import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:start_flutter/ui/others/bloc_counter/blocs/user_bloc/user_bloc.dart';
import 'package:start_flutter/ui/others/bloc_counter/blocs/user_bloc/user_events.dart';
import 'package:start_flutter/ui/others/bloc_counter/blocs/user_bloc/user_state.dart';

class BlocCounterWidget extends StatelessWidget {
  const BlocCounterWidget({super.key});

  static Widget create() {
    return Provider(
        create: (_) => UserBloc(),
        child: const BlocCounterWidget());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: const [_LogoutBtn()]),
      body: const SafeArea(
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

class _LogoutBtn extends StatelessWidget {
  const _LogoutBtn();

  @override
  Widget build(BuildContext context) {
    // final bloc = context.read<UserBloc>();
    return IconButton(
        onPressed: () {},
        icon: const Icon(Icons.logout));
  }
}

class _BtnValueInc extends StatelessWidget {
  const _BtnValueInc();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<UserBloc>();
    return ElevatedButton(
        onPressed: () => bloc.dispatch(UserIncrementEvent()),
        child: const Text("+"));
  }
}

class _BtnValueDec extends StatelessWidget {
  const _BtnValueDec();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<UserBloc>();
    return ElevatedButton(
        onPressed: () => bloc.dispatch(UserDecrementEvent()),
        child: const Text("+"));
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<UserBloc>();
    return StreamBuilder<UserState>(
        initialData: bloc.state,
        stream: bloc.stream,
        builder: (context, snapshot) {
          final age = snapshot.requireData.currentUser.age;
          return Text("$age");
        });
  }
}

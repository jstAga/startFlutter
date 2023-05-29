import 'package:flutter/material.dart';
import 'package:start_flutter/ui/geekTech/utils/Constants.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Constants.theMovieDbBackground,
            title: const Text(
              Constants.theMovieDbAuthAppBar,
            )),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: const [
            _LoginForm(),
            SizedBox(
              height: 24,
            ),
            _MainContainer(),
          ],
        ));
  }
}

class _MainContainer extends StatelessWidget {
  const _MainContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const TextStyle _textStyle = TextStyle(fontSize: 16, color: Colors.black);

    return Column(
      children: [
        const Text(Constants.theMovieDbHeader1, style: _textStyle),
        const SizedBox(
          height: 16,
        ),
        const Text(Constants.theMovieDbHeader2, style: _textStyle),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            TextButton(
              onPressed: () {},
              style: Constants.baseTheMovieDbButton,
              child: const Text(Constants.theMovieDbRegister),
            ),
            const SizedBox(
              width: 24,
            ),
            TextButton(
              onPressed: () {},
              style: Constants.baseTheMovieDbButton,
              child: const Text(Constants.theMovieDbVerifyEmail),
            )
          ],
        )
      ],
    );
  }
}

class _LoginForm extends StatefulWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  final _usernameTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  void _auth() {
    if (_usernameTextController.text == "admin" &&
        _passwordTextController.text == "admin") {
      Navigator.of(context).pushNamed("/homeTheMovieDB");
    } else {
      print("error");
    }
  }

  void _resetPassword() {}

  @override
  Widget build(BuildContext context) {
    const TextStyle _textStyle = TextStyle(fontSize: 16, color: Colors.black);
    const InputDecoration _inputDecoration = InputDecoration(
        border: OutlineInputBorder(),
        isCollapsed: true,
        contentPadding: EdgeInsets.all(8));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          Constants.theMovieDbUsername,
          style: _textStyle,
        ),
        TextField(
          decoration: _inputDecoration,
          controller: _usernameTextController,
        ),
        const SizedBox(
          height: 16,
        ),
        const Text(
          Constants.theMovieDbPassword,
          style: _textStyle,
        ),
        TextField(
          decoration: _inputDecoration,
          obscureText: true,
          controller: _passwordTextController,
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          children: [
            TextButton(
                style: Constants.baseTheMovieDbButton,
                onPressed: _auth,
                child: const Text(
                  Constants.theMovieDbLogin,
                )),
            const SizedBox(width: 24),
            TextButton(
                style: Constants.baseTheMovieDbLinkButton,
                onPressed: _resetPassword,
                child: const Text(
                  Constants.theMovieDbResetPassword,
                )),
          ],
        )
      ],
    );
  }
}

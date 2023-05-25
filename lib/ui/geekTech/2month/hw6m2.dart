import 'package:flutter/material.dart';

class Hw6m2 extends StatefulWidget {
  const Hw6m2({super.key});

  @override
  State<StatefulWidget> createState() => _Hw6m2();
}

class _Hw6m2 extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(32),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/bg_hw6_m2.jpeg"),
                fit: BoxFit.fitHeight)),
        child: const Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 20,
              ),
              _TextTitle(),
              _MainContainer()
            ],
          ),
        ));
  }
}

class _MainContainer extends StatelessWidget {
  const _MainContainer();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 120,
          ),
          const _TextWelcome(),
          const SizedBox(
            height: 10,
          ),
          const _TextSignInOrRegister(),
          const SizedBox(
            height: 60,
          ),
          const _IpEmail(),
          const SizedBox(height: 20),
          const _IpPassword(),
          const SizedBox(
            height: 20,
          ),
          _BtnSignIn(),
          const SizedBox(
            height: 20,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Forgot password?",
                style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Click here",
                style:
                TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}

class _TextWelcome extends StatelessWidget {
  const _TextWelcome();

  @override
  Widget build(BuildContext context) {
    return const _Welcome();
  }
}

class _TextSignInOrRegister extends StatelessWidget {
  const _TextSignInOrRegister();

  @override
  Widget build(BuildContext context) {
    return const _SignInOrReg();
  }
}

class _IpEmail extends StatelessWidget {
  const _IpEmail();

  @override
  Widget build(BuildContext context) {
    return const _EmailInput();
  }
}

class _BtnSignIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BtnSignInState();
  }
}

class _BtnSignInState extends State<_BtnSignIn> {
  bool _isPressed = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: double.infinity,
      child: TextButton(
        onPressed: () => setState(() => _isPressed = !_isPressed),
        style: ElevatedButton.styleFrom(
          backgroundColor: _isPressed ?  Colors.grey : Colors.brown,
          foregroundColor: Colors.white,
        ),
        child: const Text(
          "Sign in",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }
}

class _IpPassword extends StatelessWidget {
  const _IpPassword();

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: ("enter your password")),
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput();

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
          filled: true, fillColor: Colors.white, hintText: ("enter your mail")),
    );
  }
}

class _SignInOrReg extends StatelessWidget {
  const _SignInOrReg();

  @override
  Widget build(BuildContext context) {
    return const Text(
      style: TextStyle(
        color: Colors.white,
        fontSize: 25,
      ),
      "Sign in or register",
    );
  }
}

class _Welcome extends StatelessWidget {
  const _Welcome();

  @override
  Widget build(BuildContext context) {
    return const Text(
      style: TextStyle(
          fontWeight: FontWeight.bold, color: Colors.white, fontSize: 40),
      "Welcome!",
    );
  }
}

class _TextTitle extends StatelessWidget {
  const _TextTitle();

  @override
  Widget build(BuildContext context) {
    return const Text(
      style: TextStyle(
          fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25),
      "Sign in",
    );
  }
}
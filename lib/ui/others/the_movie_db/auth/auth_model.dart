import 'package:flutter/cupertino.dart';

class AuthModel extends ChangeNotifier {
  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  String? _errorMessage;
  bool _isAuthLoading = false;

  bool get canStartAuth => !_isAuthLoading;

  String? get errorMessage => _errorMessage;

  Future<void> auth(BuildContext context) async {}
}

class AuthProvider extends InheritedNotifier {
  const AuthProvider({
    super.key,
    required this.model,
    required Widget child,
  }) : super(notifier: model, child: child);

  final AuthModel model;

  static AuthProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AuthProvider>();
  }

  static AuthProvider? read(BuildContext context) {
    final widget =
        context.getElementForInheritedWidgetOfExactType<AuthProvider>()?.widget;
    return widget is AuthProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(AuthProvider oldWidget) {
    return true;
  }
}

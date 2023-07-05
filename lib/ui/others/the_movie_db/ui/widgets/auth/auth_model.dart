import 'package:flutter/cupertino.dart';
import 'package:start_flutter/ui/main_navigation/main_navigation.dart';
import 'package:start_flutter/ui/others/the_movie_db/data/remote/api_client/api_client.dart';

class AuthModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  String? _errorMessage;
  bool _isAuthLoading = false;

  bool get canStartAuth => !_isAuthLoading;
  bool get isAuthInProgress => _isAuthLoading;

  String? get errorMessage => _errorMessage;

  Future<void> auth(BuildContext context) async {
    final username = usernameTextController.text;
    final password = passwordTextController.text;
    if(username.isEmpty || password.isEmpty) {
      _errorMessage = "Username or password is empty";
      notifyListeners();
      return;
    }
    _errorMessage = null;
    _isAuthLoading = true;
    notifyListeners();
    final sessionId = await _apiClient.auth(username: username, password: password);
    _isAuthLoading = false;
    notifyListeners();
    // Navigator.pushNamed(context, MainNavigationRoutesNames.homeMovieDb);
  }
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

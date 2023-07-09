import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:start_flutter/ui/main_navigation/main_navigation.dart';
import 'package:start_flutter/ui/others/the_movie_db/data/core/network/api_client_exception.dart';
import 'package:start_flutter/ui/others/the_movie_db/data/local/data_provider/session_data_provider.dart';
import 'package:start_flutter/ui/others/the_movie_db/data/remote/api_client/auth_api_client.dart';

class AuthModel extends ChangeNotifier {
  final _apiClient = AuthApiClient();
  final _sessionDataProvider = SessionDataProvider();
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
    if (username.isEmpty || password.isEmpty) {
      _errorMessage = "Username or password is empty";
      notifyListeners();
      return;
    }
    _errorMessage = null;
    _isAuthLoading = true;
    notifyListeners();
    String? sessionId;
    int? accountId;
    try {
      sessionId = await _apiClient.auth(username: username, password: password);
      accountId = await _apiClient.getAccountInfo(sessionId);
    } on ApiClientException catch (e) {
      switch (e.type) {
        case ApiClientExceptionType.network:
          _errorMessage = "Server is not available. Check internet connection";
          break;
        case ApiClientExceptionType.auth:
          _errorMessage = "Username or password is incorrect";
          break;
        case ApiClientExceptionType.other:
          _errorMessage = "Unknown error try again";
          break;
      }
    }
    _isAuthLoading = false;
    if (errorMessage != null) {
      notifyListeners();
      return;
    } else if (sessionId == null || accountId == null) {
      _errorMessage == "Unknown error try again";
      notifyListeners();
      return;
    }
    await _sessionDataProvider.setSessionId(sessionId);
    await _sessionDataProvider.setAccountId(accountId);
    Navigator.pushReplacementNamed(
        context, MainNavigationRoutesNames.homeMovieDb);
  }
}

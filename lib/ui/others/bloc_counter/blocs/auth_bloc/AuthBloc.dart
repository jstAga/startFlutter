import 'package:start_flutter/ui/others/bloc_counter/ui/data_providers/auth_api_data_provider/auth_api_provider.dart';
import 'package:start_flutter/ui/others/bloc_counter/ui/data_providers/session_data_provider/session_data_provider.dart';

class AuthBloc{
  final _sessionDataProvider = SessionDataProvider();
  final _authApiProvider = AuthApiProvider();

  Future<bool> checkAuth() async {
    final apiKey = await _sessionDataProvider.apiKey();
    return apiKey != null;
  }

  Future<void> auth(String login, String password) async {
    final apiKey = await _authApiProvider.auth(login, password);
    await _sessionDataProvider.saveApiKey(apiKey);
  }

  Future<void> logout() async {
    await _sessionDataProvider.clearApiKey();
  }
}
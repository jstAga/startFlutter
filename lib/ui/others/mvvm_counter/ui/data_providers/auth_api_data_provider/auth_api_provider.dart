class AuthApiProvider {
  Future<String> auth(String login, String password) async {
    final isSuccess = login == "admin" && password == "admin";
    if (isSuccess) {
      return "qweqweqweqweqwljknfsjdk";
    } else {
      throw AuthApiProviderIncorrectLoginDataError;
    }
  }

  Future<void> logout() async {}
}

class AuthApiProviderIncorrectLoginDataError {}

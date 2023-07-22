import 'package:shared_preferences/shared_preferences.dart';
import 'package:start_flutter/ui/others/mvvm_counter/ui/entity/user/user.dart';

class UserDataProvider {
  final  pref =SharedPreferences.getInstance();
  var user = User(age: 0);

  Future<User> loadUser() async {
    final age = (await pref).getInt("val") ?? 0;
    return User(age: age);
  }

  Future<void> saveUser(User user) async {
    (await pref).setInt("val", user.age);
  }
}
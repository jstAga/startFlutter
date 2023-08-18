import 'package:shared_preferences/shared_preferences.dart';
import 'package:start_flutter/ui/others/bloc_counter/ui/entity/user/user_bloc_entity.dart';

class UserDataProvider {
  final  _pref =SharedPreferences.getInstance();
  var user = UserBlocEntity(age: 0);

  Future<UserBlocEntity> loadUser() async {
    final age = (await _pref).getInt("val") ?? 0;
    return UserBlocEntity(age: age);
  }

  Future<void> saveUser(UserBlocEntity user) async {
    (await _pref).setInt("val", user.age);
  }
}
import 'dart:math';

import 'package:start_flutter/ui/others/mvvm_counter/ui/data_providers/user_data_provider/user_data_provider.dart';
import 'package:start_flutter/ui/others/mvvm_counter/ui/entity/user/user.dart';

class MvvmCounterRepository {
  final _userDataProvider = UserDataProvider();
  var _user = User(age: 0);

  User get user => _user;

  Future<void> initialize() async {
    _user = await _userDataProvider.loadUser();
  }

  void incAge() {
    user.copyWith(age: user.age++);
    _userDataProvider.saveUser(_user);
  }

  void decAge() {
    _user = user.copyWith(age: max(user.age - 1, 0));
    _userDataProvider.saveUser(_user);
  }
}

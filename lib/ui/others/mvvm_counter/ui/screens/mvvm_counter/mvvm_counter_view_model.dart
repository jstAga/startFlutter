import 'package:flutter/cupertino.dart';
import 'package:start_flutter/ui/main_navigation/main_navigation.dart';
import 'package:start_flutter/ui/others/mvvm_counter/ui/screens/mvvm_counter/repository/mvvm_counter_repository.dart';
import 'package:start_flutter/ui/others/mvvm_counter/ui/screens/mvvm_counter_auth/mvvm_counter_auth_repository/mvvm_counter_auth_repository.dart';

class MvvmCounterViewModelState {
  final String ageTitle;

  MvvmCounterViewModelState({required this.ageTitle});
}

class MvvmCounterViewModel extends ChangeNotifier {
  MvvmCounterViewModel() {
    _loadUser();
  }

  final _repository = MvvmCounterRepository();
  final _authRepository = MvvmCounterAuthRepository();
  var _state = MvvmCounterViewModelState(ageTitle: '0');

  MvvmCounterViewModelState get state => _state;

  Future<void> onLogoutButtonPressed(BuildContext context) async {
    await _authRepository.logout();
    Navigator.pushNamedAndRemoveUntil(
        context, MainNavigationRoutesNames.mvvmCounterAuth, (route) => false);
  }

  void _updateState() {
    final user = _repository.user;
    _state = MvvmCounterViewModelState(ageTitle: user.age.toString());
    notifyListeners();
  }

  Future<void> _loadUser() async {
    // await UserDataProvider().loadUser();
    await _repository.initialize();
    _updateState();
  }

  Future<void> onIncrementBtnPressed() async {
    _repository.incAge();
    _updateState();
  }

  Future<void> onDecrementBtnPressed() async {
    _repository.decAge();
    _updateState();
  }
}

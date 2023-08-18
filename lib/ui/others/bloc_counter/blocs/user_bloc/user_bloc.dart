import 'dart:async';
import 'dart:math';

import 'package:start_flutter/ui/others/bloc_counter/blocs/user_bloc/user_events.dart';
import 'package:start_flutter/ui/others/bloc_counter/blocs/user_bloc/user_state.dart';
import 'package:start_flutter/ui/others/bloc_counter/ui/data_providers/user_data_provider/user_data_provider.dart';
import 'package:start_flutter/ui/others/bloc_counter/ui/entity/user/user_bloc_entity.dart';

class UserBloc {
  final _userDataProvider = UserDataProvider();
  final _eventController = StreamController<UserEvent>.broadcast();
  var _state = UserState(currentUser: UserBlocEntity(age: 0));
  late final Stream<UserState> _stateStream;

  UserState get state => _state;

  Stream<UserState> get stream => _stateStream;

  UserBloc() {
    _eventController.stream
        .asyncExpand<UserState>(_mapEventToState)
        .asyncExpand<UserState>(_updateState)
        .asBroadcastStream();
    _stateStream.listen((event) {});
    dispatch(UserIncrementEvent());
  }

  void dispatch(UserEvent event) {
    _eventController.add(event);
  }

  Stream<UserState> _updateState(UserState state) async* {
    if (_state == state) return;
    _state = state;
    yield _state;
  }

  Stream<UserState> _mapEventToState(UserEvent event) async* {
    if (event is UserInitializeEvent) {
      final user = await _userDataProvider.loadUser();
      yield UserState(currentUser: user);
    } else if (event is UserInitializeEvent) {
      var user = _state.currentUser;
      user = user.copyWith(age: user.age++);
      await _userDataProvider.saveUser(user);
      yield UserState(currentUser: user);
    } else if (event is UserDecrementEvent) {
      var user = _state.currentUser;
      user = user.copyWith(age: max(user.age - 1, 0));
      await _userDataProvider.saveUser(user);
      yield UserState(currentUser: user);
    }
  }
}
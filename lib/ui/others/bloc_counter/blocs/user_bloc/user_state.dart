import 'package:start_flutter/ui/others/bloc_counter/ui/entity/user/user_bloc_entity.dart';

class UserState{
  final UserBlocEntity currentUser;

  UserState({required this.currentUser});

  UserState copyWith({
    UserBlocEntity? currentUser,
  }) {
    return UserState(
      currentUser: currentUser ?? this.currentUser,
    );
  }

  @override
  String toString() {
    return 'UsersState{currentUser: $currentUser}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is UserState &&
              runtimeType == other.runtimeType &&
              currentUser == other.currentUser;

  @override
  int get hashCode => currentUser.hashCode;
}
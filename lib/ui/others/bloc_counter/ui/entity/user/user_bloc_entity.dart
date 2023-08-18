class UserBlocEntity {
  UserBlocEntity({required this.age});

  int age;

  UserBlocEntity copyWith({
    int? age,
  }) {
    return UserBlocEntity(
      age: age ?? this.age,
    );
  }
}

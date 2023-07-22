class User {
  User({required this.age});

  int age;

  User copyWith({
    int? age,
  }) {
    return User(
      age: age ?? this.age,
    );
  }
}

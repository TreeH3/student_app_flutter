class UserState {
  bool? isConnected;
  User? user;

  UserState({
    this.isConnected,
    this.user,
  });

  UserState copyWith({
    bool? isConnected,
    User? user,
  }) =>
      UserState(
        isConnected: isConnected ?? this.isConnected,
        user: user ?? this.user,
      );
}

class User {
  String? email;

  User({
    this.email,
  });

  User copyWith({
    String? email,
  }) =>
      User(
        email: email ?? this.email,
      );
}

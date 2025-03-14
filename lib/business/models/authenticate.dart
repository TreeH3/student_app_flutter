import 'dart:convert';

Authentication authenticationFromMap(String str) => Authentication.fromMap(json.decode(str));

String authenticationToMap(Authentication data) => json.encode(data.toMap());

class Authentication {
  String email;
  String password;

  Authentication({
    required this.email,
    required this.password,
  });

  factory Authentication.fromMap(Map<String, dynamic> json) => Authentication(
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toMap() => {
    "email": email,
    "password": password,
  };
}

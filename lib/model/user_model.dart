import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  String? id;
  String? name;
  String email;
  String password;
  User({
    this.id,
    this.name,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'name': name,
      'email': email,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] != null ? map['_id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);
}

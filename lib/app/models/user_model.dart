import 'dart:convert';

import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  String email;
  @HiveField(1)
  String password;
  @HiveField(2)
  String name;
  @HiveField(3)
  String objectId;

  UserModel({
    required this.email,
    required this.password,
    required this.name,
    required this.objectId,
  });

  factory UserModel.empty() {
    return UserModel(email: "", password: "", name: "", objectId: "");
  }

  UserModel copyWith({
    String? email,
    String? password,
    String? name,
    String? id,
  }) {
    return UserModel(
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      objectId: id ?? this.objectId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'name': name,
      'objectId': objectId,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] as String,
      password: map['password'] as String,
      name: map['name'] as String,
      objectId: map['objectId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(email: $email, password: $password, name: $name, objectId: $objectId)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.email == email &&
        other.password == password &&
        other.name == name &&
        other.objectId == objectId;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        password.hashCode ^
        name.hashCode ^
        objectId.hashCode;
  }
}

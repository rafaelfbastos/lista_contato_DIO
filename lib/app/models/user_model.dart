// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  String? objectId;
  @HiveField(4)
  String? path;
  @HiveField(5)
  String secretQuestion;
  @HiveField(6)
  String secretAnswer;

  UserModel({
    required this.email,
    required this.password,
    required this.name,
    required this.secretQuestion,
    required this.secretAnswer,
    this.path,
    this.objectId,
  });

  factory UserModel.empty() {
    return UserModel(
        email: "",
        password: "",
        name: "",
        objectId: "",
        secretAnswer: "",
        secretQuestion: "");
  }

  UserModel copyWith({
    String? email,
    String? password,
    String? name,
    String? objectId,
    String? path,
    String? secretQuestion,
    String? secretAnswer,
  }) {
    return UserModel(
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      objectId: objectId ?? this.objectId,
      path: path ?? this.path,
      secretQuestion: secretQuestion ?? this.secretQuestion,
      secretAnswer: secretAnswer ?? this.secretAnswer,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'name': name,
      'objectId': objectId,
      'path': path,
      'secretQuestion': secretQuestion,
      'secretAnswer': secretAnswer,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] as String,
      password: map['password'] as String,
      name: map['name'] as String,
      objectId: map['objectId'] != null ? map['objectId'] as String : null,
      path: map['path'] != null ? map['path'] as String : null,
      secretQuestion: map['secretQuestion'] as String,
      secretAnswer: map['secretAnswer'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(email: $email, password: $password, name: $name, objectId: $objectId, path: $path, secretQuestion: $secretQuestion, secretAnswer: $secretAnswer)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.email == email &&
        other.password == password &&
        other.name == name &&
        other.objectId == objectId &&
        other.path == path &&
        other.secretQuestion == secretQuestion &&
        other.secretAnswer == secretAnswer;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        password.hashCode ^
        name.hashCode ^
        objectId.hashCode ^
        path.hashCode ^
        secretQuestion.hashCode ^
        secretAnswer.hashCode;
  }
}

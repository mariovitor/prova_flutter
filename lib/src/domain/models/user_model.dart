// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class UserModel {
  final String userName;
  final String password;
  final List<String> texts;
  UserModel({
    required this.userName,
    required this.password,
    this.texts = const [],
  });

  UserModel copyWith({
    String? userName,
    String? password,
    List<String>? texts,
  }) {
    return UserModel(
      userName: userName ?? this.userName,
      password: password ?? this.password,
      texts: texts ?? this.texts,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userName': userName,
      'password': password,
      'texts': texts,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        userName: map['userName'] as String,
        password: map['password'] as String,
        texts: List<String>.from(
          (map['texts'] as List<String>),
        ));
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'UserModel(userName: $userName, password: $password, texts: $texts)';

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.userName == userName &&
        other.password == password &&
        listEquals(other.texts, texts);
  }

  @override
  int get hashCode => userName.hashCode ^ password.hashCode ^ texts.hashCode;
}

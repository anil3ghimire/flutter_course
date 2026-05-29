// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserInfo {
  final String username;
  final String password;
  final bool? isLogin;
  UserInfo({required this.username, required this.password, this.isLogin});

  UserInfo copyWith({String? username, String? password, bool? isLogin}) {
    return UserInfo(
      username: username ?? this.username,
      password: password ?? this.password,
      isLogin: isLogin ?? this.isLogin,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
      'isLogin': isLogin,
    };
  }

  factory UserInfo.fromMap(Map<String, dynamic> map) {
    return UserInfo(
      username: map['username'] as String,
      password: map['password'] as String,
      isLogin: map['isLogin'] != null ? map['isLogin'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserInfo.fromJson(String source) =>
      UserInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'UserInfo(username: $username, password: $password, isLogin: $isLogin)';

  @override
  bool operator ==(covariant UserInfo other) {
    if (identical(this, other)) return true;

    return other.username == username &&
        other.password == password &&
        other.isLogin == isLogin;
  }

  @override
  int get hashCode => username.hashCode ^ password.hashCode ^ isLogin.hashCode;
}

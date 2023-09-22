import '../constants.dart';

class UserModel {
  final String id;
  final String name;
  final String email;
  final String avatar;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        email: json['email'] ?? 'Email',
        name: json['name'] ?? 'Name',
        avatar: json['avatar'] ?? AppStrings.profilePicture,
      );

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['name'] = name;
    data['avatar'] = avatar;

    return data;
  }
}

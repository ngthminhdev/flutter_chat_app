class UserModel {
  final String id;
  final String username;
  final String avatar;
  final String accessToken;

  UserModel({
    required this.id,
    required this.username,
    required this.avatar,
    required this.accessToken,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      avatar: json['avatar'],
      accessToken: json['accessToken'],
    );
  }

  toJson() {
    Map<String, dynamic> data = {
      "id": id,
      "avatar": avatar,
      "username": username,
      "accessToken": accessToken,
    };
    return data;
  }
}

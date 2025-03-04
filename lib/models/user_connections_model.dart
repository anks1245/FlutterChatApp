class UserModel {
  final String name;
  final bool verified;
  final String? status;
  final String avatar;

  UserModel({
    required this.name,
    required this.verified,
    this.status,
    required this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      verified: json['verified'],
      status: json['status'],
      avatar: json['avatar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'verified': verified,
      'status': status,
      'avatar': avatar,
    };
  }
}

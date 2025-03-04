import 'dart:convert';

class ConnectionExpires {
  final int hours;
  final DateTime expiresAt;

  ConnectionExpires({
    required this.hours,
    required this.expiresAt,
  });

  factory ConnectionExpires.fromJson(Map<String, dynamic> json) {
    return ConnectionExpires(
      hours: json['hours'],
      expiresAt: DateTime.parse(json['expiresAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'hours': hours,
      'expiresAt': expiresAt.toIso8601String(),
    };
  }
}

class ComplimentModel {
  final String id;
  final String userId;
  final String userName;
  final int age;
  final String profileImage;
  final String message;
  final String storyId;
  final bool isNew;
  final ConnectionExpires connectionExpires;
  final DateTime createdAt;

  ComplimentModel({
    required this.id,
    required this.userId,
    required this.userName,
    required this.age,
    required this.profileImage,
    required this.message,
    required this.storyId,
    required this.isNew,
    required this.connectionExpires,
    required this.createdAt,
  });

  factory ComplimentModel.fromJson(Map<String, dynamic> json) {
    return ComplimentModel(
      id: json['id'],
      userId: json['userId'],
      userName: json['userName'],
      age: json['age'],
      profileImage: json['profileImage'],
      message: json['message'],
      storyId: json['storyId'],
      isNew: json['isNew'],
      connectionExpires: ConnectionExpires.fromJson(json['connectionExpires']),
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'userName': userName,
      'age': age,
      'profileImage': profileImage,
      'message': message,
      'storyId': storyId,
      'isNew': isNew,
      'connectionExpires': connectionExpires.toJson(),
      'createdAt': createdAt.toIso8601String(),
    };
  }

  static List<ComplimentModel> fromJsonList(String jsonString) {
    final List<dynamic> jsonData = jsonDecode(jsonString);
    return jsonData.map((json) => ComplimentModel.fromJson(json)).toList();
  }
}


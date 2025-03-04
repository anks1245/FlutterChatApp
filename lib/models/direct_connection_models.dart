import 'dart:math';

import 'package:flutter_chat_application/models/user_connections_model.dart';

class DirectConnectionModel {
  final UserModel user;
  final String message;
  final bool read;
  final bool pinned;

  DirectConnectionModel({
    required this.user,
    required this.message,
    required this.read,
    required this.pinned
  });

  factory DirectConnectionModel.fromJson(Map<String, dynamic> json) {
    return DirectConnectionModel(
      user: UserModel.fromJson(json['user']),
      message: json['message'],
      read: json['read'],
      pinned: json['pinned']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'message': message,
      'read': read,
      'pinned': pinned
    };
  }
}

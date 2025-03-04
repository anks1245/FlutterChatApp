import 'package:dio/dio.dart';
import 'package:flutter_chat_application/models/compliment_model.dart';
import 'package:flutter_chat_application/models/direct_connection_models.dart';
import 'package:flutter_chat_application/models/story_model.dart';

class ApiService {
  final Dio _dio = Dio();
  static const String baseUrl = 'https://3d5117bb-e783-45ef-b3a4-5212213ff42b.mock.pstmn.io/api/';

  Future<List<DirectConnectionModel>> fetchDirectConnections() async {
    try {
      final response = await _dio.get(baseUrl+'recent-chats');
      List<dynamic> data = response.data;
      return data.map((json)=> DirectConnectionModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<StoryModel>> fetchStories() async {
    try {
      final response = await _dio.get(baseUrl+'stories');
      List<dynamic> data = response.data;
      return data.map((json)=> StoryModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<ComplimentModel>> fetchCompliments(String storyId) async {
    try {
      final response = await _dio.get(baseUrl+'compliments?story='+storyId);
      List<dynamic> data = response.data;
      return data.map((json)=> ComplimentModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
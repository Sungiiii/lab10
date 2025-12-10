import 'package:dio/dio.dart';
import '../models/profile.dart';

class RestClient {
  final Dio _dio;

  RestClient(this._dio);

  Future<Profile> getProfile() async {
    try {
      final response = await _dio.get('https://jsonplaceholder.typicode.com/posts/1');
      return Profile.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to load profile: $e');
    }
  }
}
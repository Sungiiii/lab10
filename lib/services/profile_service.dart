import 'package:dio/dio.dart';
import 'rest_client.dart';
import '../models/profile.dart';

class ProfileService {
  late RestClient _client;

  ProfileService() {
    final dio = Dio();
    _client = RestClient(dio);
  }

  Future<Profile> fetchProfile() async {
    return await _client.getProfile();
  }
}
import 'package:dio/dio.dart';
import '../models/applicant_profile.dart';

class ApplicantProfileService {
  final Dio _dio;

  ApplicantProfileService(this._dio);

  Future<ApplicantProfile> fetchApplicantProfile(String userId) async {
    try {
      final response = await _dio.get('/api/users/$userId/profile');
      return ApplicantProfile.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to load applicant profile: $e');
    }
  }
}

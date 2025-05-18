import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import '../models/applicant.dart';

final dioProvider = Provider<Dio>((ref) => Dio());

final applicantsProvider = FutureProvider.family<List<Applicant>, String>((
  ref,
  eventId,
) async {
  final dio = ref.read(dioProvider);

  try {
    final response = await dio.get(
      'http://10.0.2.2:5500/api/event/$eventId/applicants/',
    );

    final data = response.data as List;
    return data.map((json) => Applicant.fromJson(json)).toList();
  } on DioException catch (e) {
    throw Exception('Dio error: ${e.message}');
  } catch (e) {
    throw Exception('Unexpected error: $e');
  }
});

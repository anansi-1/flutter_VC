import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import '../models/applicant.dart';
import 'dio_provider.dart';

final applicantsProvider = FutureProvider.family<List<Applicant>, String>((
  ref,
  eventId,
) async {
  final dio = ref.watch(dioProvider); // not read

  try {
    final response = await dio.get('/api/event/$eventId/applicants/');
    final data = response.data as List;
    return data.map((json) => Applicant.fromJson(json)).toList();
  } on DioException catch (e) {
    throw Exception('Dio error: ${e.message}');
  } catch (e) {
    throw Exception('Unexpected error: $e');
  }
});

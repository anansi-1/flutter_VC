import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/applicant_profile_service.dart';
import 'dio_provider.dart';

final applicantProfileServiceProvider = Provider<ApplicantProfileService>((
  ref,
) {
  final dio = ref.watch(dioProvider);
  return ApplicantProfileService(dio);
});

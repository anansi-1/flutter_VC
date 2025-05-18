import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/applicant_profile.dart';
import 'applicant_profile_service_provider.dart';

final applicantProfileProvider =
    FutureProvider.family<ApplicantProfile, String>((ref, userId) async {
      final service = ref.watch(applicantProfileServiceProvider);
      return service.fetchApplicantProfile(userId);
    });

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/org_event_api_service.dart';
import 'dio_provider.dart';

final orgEventApiServiceProvider = Provider<OrgEventApiService>((ref) {
  final dio = ref.watch(dioProvider);
  return OrgEventApiService(dio);
});

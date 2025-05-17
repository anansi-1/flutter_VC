import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/org_event.dart';
import 'org_event_api_service_provider.dart';

final orgEventProvider = FutureProvider<List<OrgEvent>>((ref) async {
  final apiService = ref.watch(orgEventApiServiceProvider);
  return apiService.fetchOrgEvents();
});

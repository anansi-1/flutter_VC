import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/applicants_provider.dart';
import '../models/applicant.dart';

class EventApplicantsScreen extends ConsumerWidget {
  final String eventId;

  const EventApplicantsScreen({super.key, required this.eventId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final applicantsAsync = ref.watch(applicantsProvider(eventId));

    return Scaffold(
      appBar: AppBar(title: const Text('Event Applicants')),
      body: applicantsAsync.when(
        data: (applicants) {
          if (applicants.isEmpty) {
            return const Center(child: Text('No applicants yet.'));
          }
          return ListView.builder(
            itemCount: applicants.length,
            itemBuilder: (context, index) {
              final applicant = applicants[index];
              return ListTile(
                leading: CircleAvatar(child: Text(applicant.name[0])),
                title: Text(applicant.name),
                subtitle: Text(
                  '${applicant.email}\nApplied: ${applicant.appliedAt.toLocal()}',
                ),
                isThreeLine: true,
                trailing: Text(applicant.status),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}

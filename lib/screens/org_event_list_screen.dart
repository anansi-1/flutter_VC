import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../models/org_event.dart';
import '../providers/org_event_provider.dart';

class OrgEventListScreen extends ConsumerWidget {
  const OrgEventListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventAsyncValue = ref.watch(orgEventProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Organizer Events')),
      body: eventAsyncValue.when(
        data:
            (events) => ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                final event = events[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(event.title),
                    subtitle: Text(event.subtitle),
                    trailing: Text('${event.spotsLeft} spots'),
                  ),
                );
              },
            ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}

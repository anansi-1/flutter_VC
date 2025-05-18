import 'package:flutter/material.dart';

class ApplicantProfileScreen extends StatelessWidget {
  final String eventId;
  final String userId;

  const ApplicantProfileScreen({
    super.key,
    required this.eventId,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Applicant Profile"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: Center(child: Text("Event ID: $eventId\nUser ID: $userId")),
    );
  }
}

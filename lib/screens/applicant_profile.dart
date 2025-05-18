import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/applicant_profile_provider.dart';

class ApplicantProfileScreen extends ConsumerWidget {
  final String userId;
  final String eventId;

  const ApplicantProfileScreen({
    super.key,
    required this.userId,
    required this.eventId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final applicantAsync = ref.watch(applicantProfileProvider(userId));

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // light gray background
      appBar: AppBar(
        title: const Text('Applicant Profile'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: applicantAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Error: $err')),
        data: (applicant) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Card 1: Icon, Name, Volunteer text
                    Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      color: Colors.white,
                      shadowColor: Colors.black26,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 28,
                          horizontal: 24,
                        ),
                        child: Column(
                          children: [
                            const Icon(
                              Icons.account_circle,
                              size: 68,
                              color: Color.fromARGB(255, 20, 20, 20),
                            ),
                            const SizedBox(height: 14),
                            Text(
                              applicant.name,
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Volunteer',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Card 2: Personal Information with icons
                    Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      color: Colors.white,
                      shadowColor: Colors.black26,
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Personal Information',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                                letterSpacing: 0.3,
                              ),
                            ),
                            const SizedBox(height: 12),
                            const Divider(height: 28, thickness: 1.3),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: const Icon(
                                Icons.email_outlined,
                                color: Color(0xFF3597DA),
                              ),
                              title: Text(
                                applicant.email,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: const Icon(
                                Icons.location_on_outlined,
                                color: Color(0xFF3597DA),
                              ),
                              title: Text(
                                applicant.city,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: const Icon(
                                Icons.phone_outlined,
                                color: Color(0xFF3597DA),
                              ),
                              title: Text(
                                applicant.phone,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'Bio',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                letterSpacing: 0.3,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              applicant.bio.isNotEmpty
                                  ? applicant.bio
                                  : 'No bio available',
                              style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 16,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Card 3: Volunteer Stats (Skills & Interests) without icons
                    Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      color: Colors.white,
                      shadowColor: Colors.black26,
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Volunteer Stats',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                                letterSpacing: 0.3,
                              ),
                            ),
                            const SizedBox(height: 12),
                            const Divider(height: 28, thickness: 1.3),

                            // Skills header
                            const Text(
                              'Skills',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black87,
                                letterSpacing: 0.3,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Wrap(
                              spacing: 10,
                              runSpacing: 8,
                              children:
                                  applicant.skills.isNotEmpty
                                      ? applicant.skills.map((skill) {
                                        return Chip(
                                          label: Text(
                                            skill,
                                            style: const TextStyle(
                                              color: Color(0xFF3597DA),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15,
                                            ),
                                          ),
                                          backgroundColor: const Color(
                                            0xFFD7EAF8,
                                          ),
                                          elevation: 4,
                                          shadowColor: Colors.black26,
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 14,
                                            vertical: 6,
                                          ),
                                        );
                                      }).toList()
                                      : const [
                                        Text(
                                          'No skills listed',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontStyle: FontStyle.italic,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                            ),

                            const SizedBox(height: 28),

                            // Interests header
                            const Text(
                              'Interests',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black87,
                                letterSpacing: 0.3,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Wrap(
                              spacing: 10,
                              runSpacing: 8,
                              children:
                                  applicant.interests.isNotEmpty
                                      ? applicant.interests.map((interest) {
                                        return Chip(
                                          label: Text(
                                            interest,
                                            style: const TextStyle(
                                              color: Color(0xFF3597DA),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15,
                                            ),
                                          ),
                                          backgroundColor: const Color(
                                            0xFFD7EAF8,
                                          ),
                                          elevation: 4,
                                          shadowColor: Colors.black26,
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 14,
                                            vertical: 6,
                                          ),
                                        );
                                      }).toList()
                                      : const [
                                        Text(
                                          'No interests listed',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontStyle: FontStyle.italic,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

class StudentDataDisplayPage extends StatelessWidget {
  final String phoneNumber;
  final String gender;
  final String email;

  const StudentDataDisplayPage({
    super.key,
    required this.phoneNumber,
    required this.gender,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Mahasiswa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nomor HP: $phoneNumber', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Jenis Kelamin: $gender', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Email: $email', style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

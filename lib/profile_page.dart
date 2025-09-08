import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text("Nama Aplikasi: My Flutter App", style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text("Versi: 1.0.0", style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text("Developer: Muhammad Rafly Dwi Gunawan", style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text("Dari: 5C Sistem Informasi", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

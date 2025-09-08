import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'input_mahasiswa_page.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigation Demo',
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Map<String, dynamic>? mahasiswa;

  Future<void> _callMahasiswa() async {
    if (mahasiswa == null || mahasiswa!['kontak'].isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nomor tidak tersedia')),
      );
      return;
    }

    // Ambil nomor
    String nomor = mahasiswa!['kontak'];
    if (nomor.startsWith('0')) {
      nomor = '+62${nomor.substring(1)}';
    }

    final Uri url = Uri.parse('tel:$nomor');

    try {
      await launchUrl(
        url,
        mode: LaunchMode.externalApplication, // buka aplikasi dialer
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Tidak dapat membuka aplikasi telepon')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Main Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              },
              child: const Text("Ke Profile Page"),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InputMahasiswaPage()),
                );
                if (result != null) {
                  setState(() {
                    mahasiswa = result;
                  });
                }
              },
              child: const Text("Input Data Mahasiswa"),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: mahasiswa == null ? null : _callMahasiswa,
              child: const Text("Call"),
            ),
            const SizedBox(height: 24),
            mahasiswa != null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Nama: ${mahasiswa!['nama']}"),
                      Text("Umur: ${mahasiswa!['umur']}"),
                      Text("Alamat: ${mahasiswa!['alamat']}"),
                      Text("Kontak: ${mahasiswa!['kontak']}"),
                    ],
                  )
                : const Text("Belum ada data mahasiswa"),
          ],
        ),
      ),
    );
  }
}

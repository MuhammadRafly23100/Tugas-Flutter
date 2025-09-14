import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController kelasController = TextEditingController();
  final TextEditingController prodiController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  bool _isEditing = true; // Mulai dengan true jika data belum ada

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      namaController.text = prefs.getString('nama') ?? '';
      kelasController.text = prefs.getString('kelas') ?? '';
      prodiController.text = prefs.getString('prodi') ?? '';
      emailController.text = prefs.getString('email') ?? '';
      // Jika semua field sudah terisi, mode edit = false
      if (namaController.text.isNotEmpty ||
          kelasController.text.isNotEmpty ||
          prodiController.text.isNotEmpty ||
          emailController.text.isNotEmpty) {
        _isEditing = false;
      }
    });
  }

  Future<void> _saveProfile() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('nama', namaController.text);
    await prefs.setString('kelas', kelasController.text);
    await prefs.setString('prodi', prodiController.text);
    await prefs.setString('email', emailController.text);
    setState(() {
      _isEditing = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile disimpan!')),
    );
  }

  void _enableEdit() {
    setState(() {
      _isEditing = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: namaController,
                decoration: const InputDecoration(labelText: 'Nama'),
                enabled: _isEditing,
              ),
              TextFormField(
                controller: kelasController,
                decoration: const InputDecoration(labelText: 'Kelas'),
                enabled: _isEditing,
              ),
              TextFormField(
                controller: prodiController,
                decoration: const InputDecoration(labelText: 'Prodi'),
                enabled: _isEditing,
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                enabled: _isEditing,
              ),
              const SizedBox(height: 24),
              _isEditing
                  ? ElevatedButton(
                      onPressed: _saveProfile,
                      child: const Text('Simpan'),
                    )
                  : ElevatedButton(
                      onPressed: _enableEdit,
                      child: const Text('Edit'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
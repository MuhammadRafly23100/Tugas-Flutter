import 'package:flutter/material.dart';

class InputMahasiswaPage extends StatefulWidget {
  @override
  State<InputMahasiswaPage> createState() => _InputMahasiswaPageState();
}

class _InputMahasiswaPageState extends State<InputMahasiswaPage> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _umurController = TextEditingController();
  final _alamatController = TextEditingController();
  final _kontakController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Input Mahasiswa")),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _namaController,
                  decoration: const InputDecoration(labelText: "Nama"),
                  validator: (value) =>
                      value!.isEmpty ? "Nama tidak boleh kosong" : null,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _umurController,
                  decoration: const InputDecoration(labelText: "Umur"),
                  keyboardType: TextInputType.number,
                  validator: (value) =>
                      value!.isEmpty ? "Umur tidak boleh kosong" : null,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _alamatController,
                  decoration: const InputDecoration(labelText: "Alamat"),
                  validator: (value) =>
                      value!.isEmpty ? "Alamat tidak boleh kosong" : null,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _kontakController,
                  decoration: const InputDecoration(labelText: "Kontak"),
                  keyboardType: TextInputType.phone,
                  validator: (value) =>
                      value!.isEmpty ? "Kontak tidak boleh kosong" : null,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final mahasiswa = {
                        'nama': _namaController.text,
                        'umur': _umurController.text,
                        'alamat': _alamatController.text,
                        'kontak': _kontakController.text,
                      };
                      Navigator.pop(context, mahasiswa);
                    }
                  },
                  child: const Text("Simpan"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

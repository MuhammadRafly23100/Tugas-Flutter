import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import '../models/note.dart';
import 'db/database_helper.dart';

class AddNoteScreen extends StatefulWidget {
  final Note? note;
  final int? index;

  const AddNoteScreen({super.key, this.note, this.index});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      titleController.text = widget.note!.title;
      contentController.text = widget.note!.content;
    }
  }

  void _saveNote() async {
    if (_formKey.currentState!.validate()) {
      final dbHelper = DatabaseHelper.instance;
      if (widget.note == null) {
        // Add new note
        final newNote = Note(
          title: titleController.text,
          content: contentController.text,
          createdAt: DateTime.now(),
        );
        await dbHelper.insertNote(newNote);
      } else {
        // Update existing note
        final updatedNote = Note(
          id: widget.note!.id,
          title: titleController.text,
          content: contentController.text,
          createdAt: widget.note!.createdAt,
        );
        await dbHelper.updateNote(updatedNote);
      }
      if (mounted) {
        Navigator.pop(context, true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.note == null ? "Tambah Catatan" : "Edit Catatan"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Judul'),
                validator: (value) =>
                    value!.isEmpty ? 'Judul tidak boleh kosong' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: contentController,
                decoration: const InputDecoration(labelText: 'Isi catatan'),
                maxLines: 5,
                validator: (value) =>
                    value!.isEmpty ? 'Isi tidak boleh kosong' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveNote,
                child: const Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

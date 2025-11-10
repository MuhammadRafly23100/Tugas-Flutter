import 'package:flutter/material.dart';
import '../models/note.dart';
import 'add_note_screen.dart';
import 'db/database_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Note> notes = [];
  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  Future<void> _loadNotes() async {
    final dbHelper = DatabaseHelper.instance;
    final loadedNotes = await dbHelper.getNotes();
    setState(() {
      notes = loadedNotes;
    });
  }

  Future<void> _deleteNote(int id) async {
    final dbHelper = DatabaseHelper.instance;
    await dbHelper.deleteNote(id);
    _loadNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Catatan")),
      body: notes.isEmpty
          ? const Center(child: Text("Belum ada catatan"))
          : ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                final note = notes[index];
                return Dismissible(
                  key: Key(note.id.toString()),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  onDismissed: (direction) {
                    _deleteNote(note.id!);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${note.title} dihapus')),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: ListTile(
                      title: Text(note.title),
                      subtitle: Text(note.content),
                      onTap: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => AddNoteScreen(note: note, index: index),
                          ),
                        );
                        if (result == true) {
                          _loadNotes(); // Refresh notes if a note was updated
                        }
                      },
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddNoteScreen()),
          );
          if (result == true) {
            _loadNotes(); // refresh jika ada perubahan
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

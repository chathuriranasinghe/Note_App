import 'package:flutter/material.dart';
import 'package:note_app/repository/note_repository.dart';
import 'package:note_app/widgets/round_button.dart';

class AddNote extends StatefulWidget {
  static String id = "add-note-page-screen";

  AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final NoteRepository noteRepository = NoteRepository();
  String title = "";
  String description = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade50,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                onChanged: (value) {
                  title = value;
                },
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  hintText: "Title",
                  hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Flexible(
                child: TextField(
                  onChanged: (value) {
                    description = value;
                  },
                  style: const TextStyle(color: Colors.black),
                  maxLines: 10,
                  decoration: const InputDecoration(
                    hintText: "Type Something...",
                    hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: RoundButton(
                  text: "SAVE",
                  onPressed: () async {
                    if (title.trim().isNotEmpty &&
                        description.trim().isNotEmpty) {
                      try {
                        noteRepository.addNoteToFirebase(
                          title: title.trim(),
                          description: description.trim(),
                        );
                        Navigator.pop(context);
                      } catch (e) {
                        print("Failed to add note: $e");
                      }
                    } else {
                      print("Title or description is empty");
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

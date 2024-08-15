import 'package:flutter/material.dart';
import 'package:note_app/pages/home_page.dart';
import 'package:note_app/repository/note_repository.dart';

import 'package:note_app/widgets/round_button.dart';

class EditNote extends StatefulWidget {
  final noteId;
  const EditNote({super.key, required this.noteId});

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  String title = "";
  String description = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade50,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: (value) {
                title = value;
              },
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              height: 12,
            ),
            Flexible(
                child: TextField(
              onChanged: (value) {
                description = value;
              },
              style: TextStyle(color: Colors.black),
              maxLines: 10,
              decoration: InputDecoration(
                  hintText: "Type Something...",
                  hintStyle: TextStyle(fontSize: 16, color: Colors.grey)),
            )),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: RoundButton(
                  text: "SAVE",
                  onPressed: () {
                    NoteRepository().editNoteOnFirestore(
                        title: title,
                        description: description,
                        noteId: widget.noteId);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  }),
            )
          ],
        )),
      ),
    );
  }
}

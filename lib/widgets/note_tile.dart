import 'package:flutter/material.dart';
import 'package:note_app/model/note.dart';
import 'package:intl/intl.dart';
import 'package:note_app/pages/note_page.dart';
import 'package:note_app/repository/note_repository.dart';

class NoteTile extends StatelessWidget {
  final NoteModel noteModel;
  final Color colour;

  const NoteTile({Key? key, required this.noteModel, required this.colour})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String date =
        DateFormat("MMM dd, yyyy").format(noteModel.timeSent.toDate());
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NotePage(
                        noteModel: noteModel,
                      )));
        },
        onLongPress: () {
          NoteRepository().deleteNoteOnFireStore(noteModel.noteId);
        },
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: colour,
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  noteModel.title,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Text(date)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

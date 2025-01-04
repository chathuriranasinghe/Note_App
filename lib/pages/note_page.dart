import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_app/model/note.dart';
import 'package:note_app/pages/edit_note_page.dart';
import 'package:note_app/widgets/custom_button.dart';

class NotePage extends StatelessWidget {
  final NoteModel noteModel;
  NotePage({
    Key? key,
    required this.noteModel,
  }) : super(key: key);
  static String id = 'note-page';

  @override
  Widget build(BuildContext context) {
    final String date = noteModel.timeSent != null
        ? DateFormat("MMM dd, yyyy").format(noteModel.timeSent.toDate())
        : 'Unknown Date';

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 18),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        iconData: Icons.arrow_back_ios),
                    CustomButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    EditNote(noteId: noteModel.noteId),
                              ));
                        },
                        iconData: Icons.edit),
                  ],
                ),
              ),
              Text(
                noteModel.title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    date,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade600),
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                noteModel.description,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                    fontSize: 17),
              )
            ],
          ),
        )),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_app/common/colors.dart';
import 'package:note_app/model/note.dart';
import 'package:note_app/pages/add_note_page.dart';
import 'package:note_app/pages/login_page.dart';
import 'package:note_app/repository/note_repository.dart';
import 'package:note_app/widgets/note_tile.dart';

class HomePage extends StatelessWidget {
  static String id = "main-home-page";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacementNamed(context, LoginPage.id);
      });
      return SizedBox.shrink(); // Return an empty widget while redirecting
    }

    return Scaffold(
      backgroundColor: Colors.amber.shade50,
      floatingActionButton: SizedBox(
        height: 55,
        width: 55,
        child: FloatingActionButton(
          backgroundColor: Colors.amber.shade100,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddNote()));
          },
          child: Icon(Icons.add),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.amber.shade400,
        title: Padding(
          padding: EdgeInsets.only(top: 15, bottom: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Text(
                  "NOTEONE",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 23),
                ),
              )
            ],
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: NoteRepository().displayNotes(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text('No Notes Found'),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final noteDataMap = snapshot.data!.docs[index];
              NoteModel noteModel =
                  NoteModel.fromMap(noteDataMap.data() as Map<String, dynamic>);
              return NoteTile(
                noteModel: noteModel,
                colour: MyColors().colors[index % MyColors().colors.length],
              );
            },
          );
        },
      ),
    );
  }
}

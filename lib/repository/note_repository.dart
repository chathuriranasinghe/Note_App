import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:note_app/model/note.dart';

class NoteRepository {
  var firestore = FirebaseFirestore.instance;
  var auth = FirebaseAuth.instance;

  void addNoteToFirebase({
    required String title,
    required String description,
  }) async {
    var timeSent = Timestamp.now();
    var collection = firestore.collection("notes").doc();

    NoteModel noteModel = NoteModel(
        title: title,
        description: description,
        userId: auth.currentUser!.uid,
        noteId: collection.id,
        timeSent: timeSent);

    await collection.set(noteModel.toMap());
  }

  Stream<QuerySnapshot> displayNotes() {
    return FirebaseFirestore.instance.collection("notes").snapshots();
  }

  Future<void> editNoteOnFirestore({
    required String title,
    required String description,
    required String noteId,
  }) async {
    await firestore.collection("notes").doc(noteId).update({
      "title": title,
      "description": description,
    });
  }

  Future<void> deleteNoteOnFireStore(String noteId) async {
    await firestore.collection("notes").doc(noteId).delete();
  }
}

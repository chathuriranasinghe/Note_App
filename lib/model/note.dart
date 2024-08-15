import 'package:cloud_firestore/cloud_firestore.dart';

class NoteModel {
  final String title;
  final String description;
  final String userId;
  final String noteId;
  final Timestamp timeSent;

  NoteModel({
    required this.title,
    required this.description,
    required this.userId,
    required this.noteId,
    required this.timeSent,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'userId': userId,
      'noteId': noteId,
      'timeSent': timeSent,
    };
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      userId: map['userId'] ?? '',
      noteId: map['noteId'] ?? '',
      timeSent: map['timeSent'] ?? Timestamp.now(),
    );
  }
}

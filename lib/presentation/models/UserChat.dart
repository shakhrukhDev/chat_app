import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:telegramm_clone/constants/firestore_constants.dart';

class UserChat {
  final String id;
  final String photoUrl;
  final String name;
  final String email;

  const UserChat({required this.id, required this.photoUrl, required this.name, required this.email});

  Map<String, String> toJson() {
    return {
      FireStoreConstants.name: name,
      FireStoreConstants.email: email,
      FireStoreConstants.photoUrl: photoUrl,
    };
  }

  factory UserChat.fromDocument(DocumentSnapshot doc) {
    String email = "";
    String photoUrl = "";
    String nickname = "";
    try {
      email = doc.get(FireStoreConstants.email);
    } catch (e) {}
    try {
      photoUrl = doc.get(FireStoreConstants.photoUrl);
    } catch (e) {}
    try {
      nickname = doc.get(FireStoreConstants.name);
    } catch (e) {}
    return UserChat(
      id: doc.id,
      photoUrl: photoUrl,
      name: nickname,
      email: email,
    );
  }
}
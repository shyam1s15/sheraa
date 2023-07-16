import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;

class FileRepository {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<String?> getAppLogo() async {
    QuerySnapshot snapshot = await firestore.collection("files").get();
    try {
      QueryDocumentSnapshot doc = snapshot.docs.first;
      return getImageUrl( doc.get('app_icon') );
    } catch (error) {
      print(error);
    }

    return null;
  }

  Future<String> getImageUrl(String imagePath) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child(imagePath);

    String imageUrl = await ref.getDownloadURL();
    return imageUrl;
  }
}

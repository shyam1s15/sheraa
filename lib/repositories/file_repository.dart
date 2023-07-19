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
      return getImageUrl(doc.get('app_icon'));
    } catch (error) {
      print(error);
    }

    return null;
  }

  Future<String> getImageUrl(String? imagePath) async {
    if (imagePath == null) {
      return "";
    }
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child(imagePath);

    String imageUrl = await ref.getDownloadURL();
    return imageUrl;
  }

  Future<List<String>> getImageUrls(List<String> imagePaths) async {
    FirebaseStorage storage = FirebaseStorage.instance;

    List<Future<String>> downloadUrlFutures = imagePaths.map((imagePath) {
      Reference ref = storage.ref().child(imagePath);
      return ref.getDownloadURL();
    }).toList();

    List<String> imageUrls = await Future.wait(downloadUrlFutures);
    return imageUrls;
  }

  Future<List<Map<String, dynamic>>> updateLocationToUrls(
      List<QueryDocumentSnapshot> docs) async {
    // return docs.map((doc) async {
    //   final data = doc.data() as Map<String, dynamic>;
    //   data['icon'] = await getImageUrl(data['icon']);
    //   return data;
    // }).toList();
    List<String> urls = await getImageUrls(docs.map((d) {
      return d.get("icon") as String;
    }).toList());

    List<Map<String, dynamic>> resp = [];
    for (int i = 0; i < docs.length; i++) {
      var d = docs[i].data() as Map<String, dynamic>;
      d['icon'] = urls[i];
      resp.add(d);
    }
    return resp;
  }
}

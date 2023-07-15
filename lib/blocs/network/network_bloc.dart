import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class NetworkBloc<T> {
  Future<T?> exchangePost(
      String url, dynamic payload,[T Function(dynamic)? converter]) async {
    
    try {
      final response = await http.post(Uri.parse(url), body: payload);

      if (response.statusCode == 200) {
        if (converter != null) {
          final parsedResponse = converter(jsonDecode(response.body));
          return parsedResponse;
        } else {
          return null;
        }
      } else {
        throw Exception('Failed Network Bloc: for request $url ::: with status${response.statusCode}');
      }
    } catch (error) {
      // Handle the error and show a toast message
      Fluttertoast.showToast(
        msg: 'Error: $error',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );

      // Re-throw the error to propagate it to the caller
      throw error;
    }
  }
}

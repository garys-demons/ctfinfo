import 'dart:convert';
import 'dart:io';
import 'package:ctfinfo/api/end_points.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RestClient {
  Future<dynamic> get(String path) async {
    dynamic responseJson;

    try {
      final response = await http.get(Uri.parse(EndPoints.baseUrl + path));
      debugPrint(response.body);


      debugPrint("---------------------------");
      debugPrint("Response : ${EndPoints.baseUrl + path}");
      debugPrint("Response : ${response.body.toString()}");
      debugPrint("---------------------------");
      responseJson = jsonDecode(response.body);
    } on SocketException {
      throw Exception('No Internet connection');
    }

    return responseJson;
  }
}

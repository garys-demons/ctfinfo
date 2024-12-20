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
      responseJson = jsonDecode(response.body);
      debugPrint("---------------------------");
      debugPrint("Response : ${EndPoints.baseUrl + path}");
      debugPrint("Response : ${responseJson.toString()}");
      debugPrint("---------------------------");
    } on SocketException {
      throw Exception('No Internet connection');
    }

    return responseJson;
  }
}

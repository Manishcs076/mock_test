/*
Main author: Jayprakash
This class uses http methods and creates custom methods to be used while fetching api data
This is to be used with every api calling
*/

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constants/app_api_endpoints.dart';

class BaseClient {
  final String baseUrl = AppApiEndpoints.baseUrl;
  final Duration timeoutDuration = const Duration(minutes: 1);

  final _client = http.Client();

  var headers = {
    "userid": "25794905-2dd4-40bd-97b9-9d5d69294b86",
    "token": "d61036c6-5ffd-4964-b7ff-8d5ba8ca0262"
  };

  //get data
  // ignore: body_might_complete_normally_nullable
  Future<http.Response?> getData(String endpoint) async {
    Uri url = Uri.parse(baseUrl + endpoint);

    debugPrint('URL: $url');

    try {
      http.Response response =
          await _client.get(url, headers: headers).timeout(timeoutDuration);

      debugPrint('response (${response.statusCode}): ${response.body}');

      if (_isVaidResponse(response)) {
        return response;
      } else {
        return null;
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  bool _isVaidResponse(http.Response response) {
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}

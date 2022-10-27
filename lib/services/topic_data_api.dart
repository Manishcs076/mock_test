// ignore_for_file: avoid_print, duplicate_ignore

import 'package:http/http.dart' as http;

import '../constants/app_api_endpoints.dart';
import '../models/topics_data_model.dart';
import 'base_client.dart';

BaseClient baseClient = BaseClient();

class AddServiceLeadApi {
  //final loginController = Get.put(LoginController());

  // ignore: duplicate_ignore
  static Future<List<TopicDataModel>?> fetchTopicData() async {
    String endpoint = AppApiEndpoints.topicsDataApi;
    // ignore: avoid_print
    print(endpoint);
    http.Response? response = await baseClient.getData(endpoint);
    print(response);
    if (response != null) {
      return topicDataModelFromJson(response.body.toString());
    } else {
      return null;
    }
  }
}

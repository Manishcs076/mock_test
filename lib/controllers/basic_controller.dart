// ignore_for_file: avoid_print

import 'package:get/get.dart';
import '../models/topics_data_model.dart';
import '../services/base_client.dart';
import '../services/topic_data_api.dart';

BaseClient baseClient = BaseClient();

///Creating controller
class BasicController extends GetxController {
  RxBool isLoading = false.obs;
  RxString newTestTitle = ''.obs;
  RxList<TopicDataModel> topicDataList = <TopicDataModel>[].obs;

  ///getTopicData - function to fetch api's data in the given format
  Future<List?> getTopicData() async {
    isLoading.value = true;
    List<TopicDataModel>? topicData = await AddServiceLeadApi.fetchTopicData();
    isLoading.value = false;
    topicDataList.value = topicData!;
    return topicData;
  }
}

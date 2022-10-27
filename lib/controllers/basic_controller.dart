// ignore_for_file: avoid_print

import 'package:get/get.dart';
import '../models/topics_data_model.dart';
import '../services/base_client.dart';
import '../services/topic_data_api.dart';

BaseClient baseClient = BaseClient();

class BasicController extends GetxController {
  RxString newTestTitle = ''.obs;
  RxList<TopicDataModel> topicDataList = <TopicDataModel>[].obs;
  getTopicData() async {
    List<TopicDataModel>? topicData = await AddServiceLeadApi.fetchTopicData();
    topicDataList.value = topicData!;
  }
}

// To parse this JSON data, do
//
//     final topicDataModel = topicDataModelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

import 'package:get/get.dart';

class TopicDataModel {
  TopicDataModel({
    required this.topicName,
    required this.concepts,
  });

  String? topicName;
  List<String>? concepts;
  RxList<String> selectedConcepts = <String>[].obs;
  RxBool titleChecked = false.obs;

  factory TopicDataModel.fromJson(Map<String, dynamic> json) => TopicDataModel(
        topicName: json["topicName"] == null ? '' : json["topicName"],
        concepts: json["concepts"] == null
            ? []
            : List<String>.from(json["concepts"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "topicName": topicName == null ? '' : topicName,
        "concepts":
            concepts == null ? [] : List<dynamic>.from(concepts!.map((x) => x)),
      };
}

List<TopicDataModel> topicDataModelFromJson(String str) =>
    List<TopicDataModel>.from(
        json.decode(str).map((x) => TopicDataModel.fromJson(x)));

String topicDataModelToJson(List<TopicDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

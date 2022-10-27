import 'package:hive/hive.dart';

part 'created_test_model.g.dart';

@HiveType(typeId: 1)
class CreatedTestModel {
  @HiveField(0)
  String testName;
  @HiveField(1)
  DateTime createdDate;
  CreatedTestModel(this.testName, this.createdDate);
}

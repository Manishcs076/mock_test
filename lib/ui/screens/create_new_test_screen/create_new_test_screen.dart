// ignore_for_file: avoid_print, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:mock_test_app/controllers/basic_controller.dart';
import 'package:mock_test_app/ui/widgets/default_text_form_field.dart';

import '../../../models/created_test_model.dart';
import '../landing_screen/landing_screen.dart';

class NewTestScreenCreationScreen extends StatefulWidget {
  static const String id = '/new_test_creation_screen';
  const NewTestScreenCreationScreen({super.key});

  @override
  State<NewTestScreenCreationScreen> createState() =>
      _NewTestScreenCreationScreenState();
}

final basicController = Get.find<BasicController>();

class _NewTestScreenCreationScreenState
    extends State<NewTestScreenCreationScreen> {
  late final Box box;

  @override
  void initState() {
    box = Hive.box('testBox');
    basicController.getTopicData();
    basicController.newTestTitle.value = '';
    super.initState();
  }

  @override
  void dispose() {
    basicController.newTestTitle.value;
    super.dispose();
  }

  _addInfo() async {
    CreatedTestModel newPerson =
        CreatedTestModel(basicController.newTestTitle.value, DateTime.now());
    box.add(newPerson);
    print('Info added to box!');
  }

  String? _fieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field can\'t be empty';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.blue,
          ),
        ),
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.only(left: 40.r),
          child: Text(
            "Create New Test",
            style: TextStyle(
              color: const Color.fromARGB(
                200,
                29,
                28,
                28,
              ),
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 55.r, right: 55.r, top: 55.r),
                  child: DefaultTextFormField(
                    autofocus: false,
                    cursorColor: null,
                    maxLength: 25,
                    hintText: "Test Name",
                    enabledBorderColor: Colors.blue,
                    focusedBorderColor: Colors.blue,
                    keyBoardType: TextInputType.text,
                    textCapitalization: TextCapitalization.none,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.only(
                      left: 30.r,
                      top: 50.r,
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(
                        left: 18.0.r,
                        right: 18.0.r,
                      ),
                      child: Icon(
                        Icons.portrait,
                        size: 30.h,
                        color: Colors.blue,
                      ),
                    ),
                    onChange: (title) {
                      basicController.newTestTitle.value = title;
                      print(basicController.newTestTitle.value);
                    },
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Obx(
                  () => ListView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: basicController.topicDataList.length,
                    itemBuilder: (BuildContext context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: 10.r,
                        ),
                        child: ExpansionTile(
                          leading: Obx(() => Checkbox(
                                value: basicController
                                    .topicDataList[index].titleChecked.value,
                                onChanged: (val) {
                                  basicController.topicDataList[index]
                                      .titleChecked.value = val!;
                                  if (val) {
                                    basicController
                                        .topicDataList[index].selectedConcepts
                                        .clear();
                                    basicController
                                        .topicDataList[index].selectedConcepts
                                        .addAll(basicController
                                            .topicDataList[index].concepts!);
                                  } else {
                                    basicController
                                        .topicDataList[index].selectedConcepts
                                        .clear();
                                  }
                                },
                              )),
                          title: Row(
                            children: [
                              Text(basicController
                                  .topicDataList[index].topicName
                                  .toString())
                            ],
                          ),
                          children: List.generate(
                              basicController.topicDataList[index].concepts!
                                  .length, (innerIndex) {
                            return ListTile(
                              contentPadding: EdgeInsets.only(left: 40.w),
                              onTap: () {
                                if (basicController
                                    .topicDataList[index].selectedConcepts
                                    .contains(basicController
                                        .topicDataList[index]
                                        .concepts![innerIndex])) {
                                  basicController
                                      .topicDataList[index].selectedConcepts
                                      .removeWhere((element) =>
                                          element ==
                                          basicController.topicDataList[index]
                                              .concepts![innerIndex]);
                                } else {
                                  basicController
                                      .topicDataList[index].selectedConcepts
                                      .add(basicController.topicDataList[index]
                                          .concepts![innerIndex]);
                                }
                                print(
                                    "${basicController.topicDataList[index].concepts![innerIndex].toString()} tapped");
                              },
                              leading: Obx(() => Checkbox(
                                  value: basicController
                                      .topicDataList[index].selectedConcepts
                                      .contains(basicController
                                          .topicDataList[index]
                                          .concepts![innerIndex]),
                                  onChanged: (isClicked) {
                                    if (basicController
                                        .topicDataList[index].selectedConcepts
                                        .contains(basicController
                                            .topicDataList[index]
                                            .concepts![innerIndex])) {
                                      basicController
                                          .topicDataList[index].selectedConcepts
                                          .removeWhere((element) =>
                                              element ==
                                              basicController
                                                  .topicDataList[index]
                                                  .concepts![innerIndex]);
                                    } else {
                                      basicController
                                          .topicDataList[index].selectedConcepts
                                          .add(basicController
                                              .topicDataList[index]
                                              .concepts![innerIndex]);
                                    }
                                  })),
                              title: Text(basicController
                                  .topicDataList[index].concepts![innerIndex]
                                  .toString()),
                            );
                          }),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Obx(() {
              return Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 30.r),
                  child: SizedBox(
                    height: 35.h,
                    width: 260.w,
                    child: ElevatedButton(
                      onPressed: basicController.newTestTitle.value == ''
                          ? () {
                              final snackBar = SnackBar(
                                content: const Text('Test title is missing'),
                                action: SnackBarAction(
                                  label: 'Enter test title',
                                  onPressed: () {
                                    // Some code to undo the change.
                                  },
                                ),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          : () {
                              _addInfo();
                              Get.offAll(const LandingScreen());
                            },
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Create",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

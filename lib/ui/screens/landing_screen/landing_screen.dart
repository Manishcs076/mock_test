// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mock_test_app/ui/widgets/default_container.dart';
import 'package:intl/intl.dart';
import '../create_new_test_screen/create_new_test_screen.dart';
import 'package:lottie/lottie.dart';

class LandingScreen extends StatefulWidget {
  static const String id = '/landing_screen';
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  late final Box contactBox;
  @override
  void initState() {
    basicController.getTopicData();
    contactBox = Hive.box('testBox');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            // ignore: avoid_unnecessary_containers
            Positioned(
              top: 10.h,
              child: SizedBox(
                height: 294.5.h,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 40.r,
                          bottom: 20.r,
                        ),
                        child: Text(
                          "Mock Test App",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.black12,
                      height: 120.h,
                      width: 220.w,
                      child: Center(
                        child: Lottie.asset(
                          'assets/images/student_lottie.json',
                          width: 200,
                          height: 200,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      height: 35.h,
                      width: 260.w,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(() => const NewTestScreenCreationScreen());
                        },
                        child: Center(
                          child: Text(
                            "Create New Test",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Divider(
                      color: Colors.blue,
                      thickness: 2.h,
                    ),
                  ],
                ),
              ),
            ),

            Positioned.fill(
              top: 300.r,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 20.r,
                  left: 12.r,
                  right: 12.r,
                ),
                child: Column(
                  children: [
                    ValueListenableBuilder(
                      valueListenable: contactBox.listenable(),
                      builder: (context, Box box, widget) {
                        if (box.isEmpty) {
                          return const Center(
                            child: Text('No test create'),
                          );
                        } else {
                          return ListView.builder(
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: box.length,
                            itemBuilder: (BuildContext context, index) {
                              var currentBox = box;
                              var testData = currentBox.getAt(index)!;
                              final DateTime now = testData.createdDate;
                              String formattedTime =
                                  DateFormat('kk:mm:a').format(now);
                              String dateFormat = Jiffy(now).yMMMMd;

                              return Padding(
                                padding: EdgeInsets.only(
                                  bottom: 30.r,
                                ),
                                child: DefaultContainer(
                                  containerColor: Colors.white,
                                  height: 100.h,
                                  width: MediaQuery.of(context).size.width.w,
                                  borderWidth: 0.5.r,
                                  borderColor: const Color.fromARGB(
                                    255,
                                    203,
                                    203,
                                    203,
                                  ),
                                  boxShadowColor: Colors.transparent,
                                  boxOffset: const Offset(
                                    0,
                                    0,
                                  ),
                                  blurRadius: 0,
                                  spreadRadius: 0,
                                  borderBottomLeftRadius: 18.r,
                                  borderBottomRightRadius: 18.r,
                                  borderTopLeftRadius: 18.r,
                                  borderTopRightRadius: 18.r,
                                  child: Padding(
                                    padding: const EdgeInsets.all(
                                      12.0,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              testData.testName,
                                              style: TextStyle(
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              "Created on ",
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Text(
                                              "$dateFormat $formattedTime",
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w400,
                                                color: const Color.fromARGB(
                                                  255,
                                                  101,
                                                  101,
                                                  101,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

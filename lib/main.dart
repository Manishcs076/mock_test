import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mock_test_app/controllers/basic_controller.dart';
import 'package:mock_test_app/ui/screens/landing_screen/landing_screen.dart';

import 'models/created_test_model.dart';
import 'services/navigator_service.dart';

import 'ui/screens/create_new_test_screen/create_new_test_screen.dart';
import 'ui/utils/service_locator.dart';

var navigatorService = locator<NavigatorService>();

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CreatedTestModelAdapter());
  await Hive.openBox('testBox');
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(BasicController());
    return ScreenUtilInit(
      designSize: const Size(360, 772),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          navigatorKey: navigatorService.navigatorKey,
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light().copyWith(),
          initialRoute: LandingScreen.id,
          // initialBinding: const LandingPage(),
          getPages: [
            GetPage(
              name: LandingScreen.id,
              page: () => const LandingScreen(),
            ),
            GetPage(
              name: NewTestScreenCreationScreen.id,
              page: () => const NewTestScreenCreationScreen(),
              transition: Transition.rightToLeft,
              transitionDuration: const Duration(milliseconds: 400),
              curve: Curves.fastOutSlowIn,
            ),
          ],
        );
      },
    );
  }
}

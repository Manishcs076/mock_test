import 'package:get_it/get_it.dart';

import '../../services/navigator_service.dart';

final locator = GetIt.instance;

void setupLocator() {
  // locator.registerSingleton<ApiService>(ApiService());
  locator.registerSingleton(NavigatorService());
  // locator.registerSingleton(AvailableCameraController());
}

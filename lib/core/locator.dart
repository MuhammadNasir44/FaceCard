import 'package:face_card/core/services/auth_services.dart';
import 'package:get_it/get_it.dart';


GetIt locator = GetIt.instance;
// GetIt deviceLocator = GetIt.instance;
setupLocator() {
  print("AuthServices calling");
  locator.registerSingleton(AuthServices());
  // deviceLocator.registerSingleton(DeviceType());
  // locator.registerSingleton(DatabaseServices());
  print("AuthServices registered");
}
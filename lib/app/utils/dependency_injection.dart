import 'package:akm/app/service/network_services.dart';
import 'package:get/get.dart';

class DependencyInjection {
  static void init() async {
    //services
    Get.put<NetworkStatusService>(NetworkStatusService(), permanent: true);
  }
}

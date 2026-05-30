import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:quran_mobile_app/config/network/dio_client.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DioClient());

    Get.lazyPut<Dio>(() => Get.find<DioClient>().dio);
  }
}

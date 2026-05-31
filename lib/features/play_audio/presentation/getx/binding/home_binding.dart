import 'package:get/get.dart';
import 'package:quran_mobile_app/features/play_audio/data/datasource/quran_datasource.dart';
import 'package:quran_mobile_app/features/play_audio/data/datasource/quran_datasource_impl.dart';
import 'package:quran_mobile_app/features/play_audio/domain/repositories/quran_repositories.dart';
import 'package:quran_mobile_app/features/play_audio/domain/repositories/quran_repositories_impl.dart';
import 'package:quran_mobile_app/features/play_audio/presentation/getx/controller/audio_controller.dart';
import 'package:quran_mobile_app/features/play_audio/presentation/getx/controller/filter_controller.dart';
import 'package:quran_mobile_app/features/play_audio/presentation/getx/controller/preview_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // datasouce
    Get.lazyPut<QuranDatasource>(() {
      return QuranDatasourceImpl(Get.find());
    });

    // repositories
    Get.lazyPut<QuranRepositories>(() {
      return QuranRepositoriesImpl(Get.find());
    });

    // controller
    Get.lazyPut(() => FilterController());
    Get.lazyPut(() => AudioController(Get.find()));

    Get.lazyPut(() => PreviewController(Get.find()));
  }
}

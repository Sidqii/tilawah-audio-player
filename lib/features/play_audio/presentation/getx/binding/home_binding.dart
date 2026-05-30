import 'package:get/get.dart';
import 'package:quran_mobile_app/features/play_audio/data/datasource/surah_datasource.dart';
import 'package:quran_mobile_app/features/play_audio/data/datasource/surah_datasource_impl.dart';
import 'package:quran_mobile_app/features/play_audio/data/repositories/surah_repositories.dart';
import 'package:quran_mobile_app/features/play_audio/data/repositories/surah_repositories_impl.dart';
import 'package:quran_mobile_app/features/play_audio/presentation/getx/controller/audio_controller.dart';
import 'package:quran_mobile_app/features/play_audio/presentation/getx/controller/filter_controller.dart';
import 'package:quran_mobile_app/features/play_audio/presentation/getx/controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SurahDatasource>(() {
      return SurahDatasourceImpl(Get.find());
    });

    Get.lazyPut<SurahRepositories>(() {
      return SurahRepositoriesImpl(Get.find());
    });

    Get.lazyPut(() => AudioController());
    Get.lazyPut(() => FilterController());

    Get.lazyPut(() => HomeController(Get.find(), Get.find()));
  }
}

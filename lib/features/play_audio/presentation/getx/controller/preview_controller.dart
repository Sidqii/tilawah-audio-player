import 'package:get/get.dart';
import 'package:quran_mobile_app/features/play_audio/domain/entities/qari.dart';
import 'package:quran_mobile_app/features/play_audio/domain/entities/surah.dart';
import 'package:quran_mobile_app/features/play_audio/domain/repositories/quran_repositories.dart';
import 'package:quran_mobile_app/features/play_audio/presentation/getx/controller/audio_controller.dart';
import 'package:quran_mobile_app/features/play_audio/presentation/getx/controller/filter_controller.dart';

class PreviewController extends GetxController {
  final QuranRepositories repositories;

  PreviewController(this.repositories);

  AudioController get audioController => Get.find<AudioController>();
  FilterController get filterController => Get.find<FilterController>();

  final surahList = <Surah>[].obs;
  final qariList = <Qari>[].obs;

  final previewSurah = Rxn<Surah>();
  final previewQari = Rxn<Qari>();

  final isLoading = RxBool(false);

  @override
  void onInit() {
    super.onInit();

    getSurah();

    getQari();
  }

  Future<void> getQari() async {
    try {
      isLoading(true);

      final result = await repositories.getQari();

      qariList.assignAll(result);

      previewQari.value = result.firstWhere(
        (qari) => qari.identifier == 'ar.alafasy',
      );
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  Future<void> getSurah() async {
    try {
      isLoading(true);

      final result = await repositories.getSurah();

      surahList.assignAll(result);

      if (result.isNotEmpty) {
        previewSurah.value = result.first;
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}

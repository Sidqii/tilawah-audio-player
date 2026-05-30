import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quran_mobile_app/features/play_audio/data/repositories/surah_repositories.dart';
import 'package:quran_mobile_app/features/play_audio/domain/entities/qari.dart';
import 'package:quran_mobile_app/features/play_audio/domain/entities/surah.dart';
import 'package:quran_mobile_app/features/play_audio/presentation/getx/controller/audio_controller.dart';

class HomeController extends GetxController {
  final SurahRepositories repositories;
  final AudioController audioController;

  HomeController(this.repositories, this.audioController);

  final surah = <Surah>[].obs;
  final qari = <Qari>[].obs;

  final selectedSurah = Rxn<Surah>();
  final selectedQari = Rxn<Qari>();

  final isLoading = RxBool(false);

  @override
  void onInit() {
    super.onInit();

    getSurah();

    getQari();

    audioController.audio.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        playNextSurah();
      }
    });
  }

  Future<void> getQari() async {
    try {
      isLoading(true);

      final result = await repositories.getQari();

      qari.assignAll(result);

      selectedQari.value = result.firstWhere(
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

      surah.assignAll(result);

      if (result.isNotEmpty) {
        selectedSurah.value = result.first;
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  Future<void> playSurah(int number) async {
    final detail = await repositories.getSurahDetail(
      number,
      selectedQari.value!.identifier,
    );

    selectedSurah.value = surah.firstWhere(
      (element) => element.number == number,
    );

    await audioController.playSurah(detail);
  }

  Future<void> playNextSurah() async {
    if (surah.isEmpty) return;

    final currentNumber = audioController.currentNumber.value;

    final currentIndex = surah.indexWhere(
      (item) => item.number == currentNumber,
    );

    if (currentIndex < 0) return;

    if (currentIndex >= surah.length - 1) return;

    await playSurah(surah[currentIndex + 1].number);
  }

  @override
  void onClose() {
    super.onClose();
  }
}

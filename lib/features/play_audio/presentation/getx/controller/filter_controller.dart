import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_mobile_app/features/play_audio/domain/entities/qari.dart';
import 'package:quran_mobile_app/features/play_audio/domain/entities/surah.dart';
import 'package:quran_mobile_app/features/play_audio/presentation/getx/controller/audio_controller.dart';
import 'package:quran_mobile_app/features/play_audio/presentation/getx/controller/preview_controller.dart';

class FilterController extends GetxController {
  // final previewController = Get.find<PreviewController>();
  // final audioController = Get.find<AudioController>();

  PreviewController get previewController => Get.find<PreviewController>();
  AudioController get audioController => Get.find<AudioController>();

  final searchController = TextEditingController();

  final surahQuery = ''.obs;
  final qariQuery = ''.obs;

  List<Surah> get filteredSurah {
    if (surahQuery.value.isEmpty) {
      return previewController.surahList;
    }

    return previewController.surahList.where((surah) {
      final keyword = surahQuery.value.toLowerCase();

      return surah.englishName.toLowerCase().contains(keyword);
    }).toList();
  }

  List<Qari> get filteredQari {
    if (qariQuery.value.isEmpty) {
      return previewController.qariList;
    }

    return previewController.qariList.where((qari) {
      final keyword = qariQuery.value.toLowerCase();

      return qari.englishName.toLowerCase().contains(keyword);
    }).toList();
  }

  Future<void> playSelectedSurah(int surahNumber) async {
    searchController.clear();

    surahQuery.value = '';

    audioController.playSurah(surahNumber);
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}

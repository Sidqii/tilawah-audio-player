import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_mobile_app/features/play_audio/domain/entities/qari.dart';
import 'package:quran_mobile_app/features/play_audio/domain/entities/surah.dart';
import 'package:quran_mobile_app/features/play_audio/presentation/getx/controller/home_controller.dart';

class FilterController extends GetxController {
  final homeController = Get.find<HomeController>();

  final searchController = TextEditingController();

  final surahQuery = ''.obs;
  final qariQuery = ''.obs;

  List<Surah> get filteredSurah {
    if (surahQuery.value.isEmpty) {
      return homeController.surah;
    }

    return homeController.surah.where((surah) {
      final keyword = surahQuery.value.toLowerCase();

      return surah.englishName.toLowerCase().contains(keyword);
    }).toList();
  }

  List<Qari> get filteredQari {
    if (qariQuery.value.isEmpty) {
      return homeController.qari;
    }

    return homeController.qari.where((qari) {
      final keyword = qariQuery.value.toLowerCase();

      return qari.englishName.toLowerCase().contains(keyword);
    }).toList();
  }
}

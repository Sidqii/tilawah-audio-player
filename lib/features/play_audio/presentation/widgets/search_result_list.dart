import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_mobile_app/features/play_audio/presentation/getx/controller/filter_controller.dart';
import 'package:quran_mobile_app/features/play_audio/presentation/getx/controller/home_controller.dart';

class SearchResultList extends GetView<FilterController> {
  const SearchResultList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.surahQuery.value.isEmpty) {
        return const SizedBox.shrink();
      }

      final result = controller.filteredSurah;

      return ListView.builder(
        shrinkWrap: true,
        itemCount: result.length,
        itemBuilder: (context, index) {
          final surah = result[index];

          return ListTile(
            title: Text(surah.englishName),

            subtitle: Text(surah.name),

            trailing: Text(surah.number.toString()),

            onTap: () {
              FocusScope.of(context).unfocus();

              controller.searchController.clear();

              controller.surahQuery.value = '';

              Get.find<HomeController>().playSurah(surah.number);
            },
          );
        },
      );
    });
  }
}

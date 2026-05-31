import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_mobile_app/features/play_audio/presentation/getx/controller/preview_controller.dart';

class SurahListPage extends GetView<PreviewController> {
  const SurahListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: Get.back,
          icon: const Icon(Icons.arrow_back_ios_new),
        ),

        title: TextField(
          controller: controller.filterController.searchController,

          decoration: const InputDecoration(
            hintText: 'Cari Surah...',
            border: InputBorder.none,
          ),

          onChanged: (value) {
            controller.filterController.surahQuery.value = value;
          },
        ),
      ),

      body: Obx(() {
        final result = controller.filterController.filteredSurah;
      
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
      
        return ListView.builder(
          itemCount: result.length,
          itemBuilder: (context, index) {
            final surah = result[index];
      
            return ListTile(
              leading: CircleAvatar(child: Text(surah.number.toString())),
      
              title: Text(surah.englishName),
      
              subtitle: Text(surah.name),
      
              trailing: Text('${surah.numberOfAyah} Ayat'),
      
              onTap: () {
                controller.previewSurah.value = surah;
      
                controller.audioController.playSurah(
                  controller.previewSurah.value?.number ?? 0,
                );
      
                Get.back();
              },
            );
          },
        );
      }),
    );
  }
}

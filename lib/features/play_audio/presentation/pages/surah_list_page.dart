import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_mobile_app/features/play_audio/presentation/getx/controller/home_controller.dart';

class SurahListPage extends GetView<HomeController> {
  const SurahListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: Get.back,
          icon: Icon(Icons.arrow_back_ios_new),
        ),

        title: const Text('Daftar Surah'),
      ),

      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: controller.surah.length,
          itemBuilder: (context, index) {
            final surah = controller.surah[index];

            return ListTile(
              leading: CircleAvatar(child: Text(surah.number.toString())),

              title: Text(surah.englishName),

              subtitle: Text(surah.name),

              trailing: Text('${surah.numberOfAyah} Ayat'),

              onTap: () {
                controller.selectedSurah.value = surah;

                controller.playSurah(
                  controller.selectedSurah.value?.number ?? 0,
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

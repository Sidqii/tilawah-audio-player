import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_mobile_app/app/routes/app_pages.dart';
import 'package:quran_mobile_app/features/play_audio/presentation/getx/controller/home_controller.dart';
import 'package:quran_mobile_app/features/play_audio/presentation/widgets/audio/current_ayah_indicator.dart';
import 'package:quran_mobile_app/features/play_audio/presentation/widgets/audio/surah_info.dart';
import 'package:quran_mobile_app/features/play_audio/presentation/widgets/audio/surah_player_controls.dart';
import 'package:quran_mobile_app/features/play_audio/presentation/widgets/audio/surah_progress_slider.dart';
import 'package:quran_mobile_app/shared/themes/app_color.dart';

class AudioPlayer extends GetView<HomeController> {
  const AudioPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final surah = controller.selectedSurah.value;

      if (surah == null) {
        return const SizedBox.shrink();
      }

      return Column(
        children: [
          // navigate to surah list
          GestureDetector(
            onTap: () => Get.toNamed(AppRoutes.LIST),

            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 30, 5, 10),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,

                children: [
                  Text(
                    'Daftar surah',
                    style: TextStyle(color: AppColor.grey600),
                  ),

                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 12,
                    color: AppColor.grey600,
                  ),
                ],
              ),
            ),
          ),

          // main menu
          Container(
            width: double.infinity,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColor.grey300),
            ),

            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,

                children: [
                  SurahInfo(surah: surah),

                  const SizedBox(height: 10),

                  const SurahProgressSlider(),

                  const SizedBox(height: 10),

                  const CurrentAyahIndicator(),

                  SurahPlayerControls(surahNumber: surah.number),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}

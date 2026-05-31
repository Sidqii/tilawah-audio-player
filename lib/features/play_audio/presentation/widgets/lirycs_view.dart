import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_mobile_app/features/play_audio/presentation/getx/controller/audio_controller.dart';
import 'package:quran_mobile_app/shared/themes/app_color.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class LirycsView extends GetView<AudioController> {
  const LirycsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final currentIndex = controller.playingAyahIndex.value;

      final surah = controller.playingSurah.value;

      if (surah == null) {
        return const SizedBox.shrink();
      }

      return ScrollablePositionedList.builder(
        itemScrollController: controller.itemScrollController,
        itemCount: surah.ayahs.length,
        itemBuilder: (context, index) {
          final ayah = surah.ayahs[index];

          final isCurrent = index == currentIndex;

          return Padding(
            key: ValueKey('${index}_${isCurrent}'),

            padding: const EdgeInsets.symmetric(vertical: 10),

            child: Text(
              ayah.text,
              textAlign: TextAlign.end,

              style: TextStyle(
                fontSize: 28,
                color: isCurrent ? AppColor.grey900 : AppColor.grey600,
                fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          );
        },
      );
    });
  }
}

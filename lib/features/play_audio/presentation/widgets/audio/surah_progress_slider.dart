import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_mobile_app/features/play_audio/presentation/getx/controller/home_controller.dart';
import 'package:quran_mobile_app/shared/themes/app_color.dart';

class SurahProgressSlider extends GetView<HomeController> {
  const SurahProgressSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final audio = controller.audioController;

    return Obx(() {
      final position = audio.position.value;
      final duration = audio.duration.value ?? Duration.zero;

      return SliderTheme(
        data: SliderTheme.of(context).copyWith(
          trackHeight: 1,

          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),

          overlayShape: SliderComponentShape.noOverlay,

          thumbColor: AppColor.grey900,

          activeTrackColor: AppColor.grey900,
        ),

        child: Column(
          children: [
            Slider(
              value: position.inSeconds.toDouble().clamp(
                0,
                duration.inSeconds.toDouble(),
              ),

              max: duration.inSeconds > 0 ? duration.inSeconds.toDouble() : 1,

              onChanged: (value) {
                audio.seekSurah(Duration(seconds: value.toInt()));
              },
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Text(formatDuration(position)),

                Text(formatDuration(duration)),
              ],
            ),
          ],
        ),
      );
    });
  }

  String formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');

    return '$minutes:$seconds';
  }
}

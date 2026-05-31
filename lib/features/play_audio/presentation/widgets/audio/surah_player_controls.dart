import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_mobile_app/features/play_audio/presentation/getx/controller/preview_controller.dart';

class SurahPlayerControls extends GetView<PreviewController> {
  final int surahNumber;

  const SurahPlayerControls({required this.surahNumber, super.key});

  @override
  Widget build(BuildContext context) {
    final audio = controller.audioController;

    return Obx(() {
      final current = audio.playingSurah.value?.number;

      return Row(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          IconButton(
            onPressed: audio.prevAyah,
            iconSize: 40,
            icon: Icon(Icons.skip_previous),
          ),

          IconButton(
            onPressed: () async {
              if (current == surahNumber) {
                await audio.togglePlay();
              } else {
                await controller.audioController.playSurah(surahNumber);
              }
            },

            iconSize: 64,
            icon: Icon(
              current == surahNumber && audio.isPlaying.value
                  ? Icons.pause_circle
                  : Icons.play_circle,
            ),
          ),

          IconButton(
            onPressed: audio.nextAyah,
            iconSize: 40,
            icon: Icon(Icons.skip_next),
          ),
        ],
      );
    });
  }
}

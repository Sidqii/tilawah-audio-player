import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_mobile_app/features/play_audio/presentation/getx/controller/preview_controller.dart';

class CurrentAyahIndicator extends GetView<PreviewController> {
  const CurrentAyahIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final audio = controller.audioController;

    return Obx(() {
      final index = audio.playingAyahIndex.value;

      return Center(
        child: Text(
          'Ayat ${index + 1}',

          style: Theme.of(context).textTheme.labelLarge,
        ),
      );
    });
  }
}

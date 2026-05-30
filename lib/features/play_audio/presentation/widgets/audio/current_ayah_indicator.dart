import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_mobile_app/features/play_audio/presentation/getx/controller/home_controller.dart';

class CurrentAyahIndicator extends GetView<HomeController> {
  const CurrentAyahIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final audio = controller.audioController;

    return Obx(() {
      final index = audio.currentAyahIndex.value;

      return Center(
        child: Text(
          'Ayat ${index + 1}',

          style: Theme.of(context).textTheme.labelLarge,
        ),
      );
    });
  }
}

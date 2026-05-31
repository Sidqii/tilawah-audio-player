import 'package:flutter/material.dart';
import 'package:quran_mobile_app/features/play_audio/presentation/widgets/audio_player.dart';
import 'package:quran_mobile_app/features/play_audio/presentation/widgets/lirycs_view.dart';
import 'package:quran_mobile_app/features/play_audio/presentation/widgets/filter/select_qari.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SelectQari(),

              Expanded(child: LirycsView()),

              AudioPlayer(),
            ],
          ),
        ),
      ),
    );
  }
}

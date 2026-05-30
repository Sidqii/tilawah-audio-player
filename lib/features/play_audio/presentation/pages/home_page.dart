import 'package:flutter/material.dart';
import 'package:quran_mobile_app/features/play_audio/presentation/widgets/audio_player.dart';
import 'package:quran_mobile_app/features/play_audio/presentation/widgets/search_result_list.dart';
import 'package:quran_mobile_app/features/play_audio/presentation/widgets/search_surah_field.dart';
import 'package:quran_mobile_app/features/play_audio/presentation/widgets/select_qari.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: const Padding(
          padding: EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchSurahField(),

              const SizedBox(height: 13),

              Text('  Suara pembaca'),

              const SizedBox(height: 3),

              SelectQari(),

              Expanded(child: SearchResultList()),

              AudioPlayer(),
            ],
          ),
        ),
      ),
    );
  }
}

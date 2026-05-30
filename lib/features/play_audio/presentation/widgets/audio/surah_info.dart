import 'package:flutter/material.dart';
import 'package:quran_mobile_app/features/play_audio/domain/entities/surah.dart';

class SurahInfo extends StatelessWidget {
  final Surah surah;

  const SurahInfo({required this.surah, super.key});

  static const title = TextStyle(fontSize: 30, fontWeight: FontWeight.w500);
  static const subtitle = TextStyle(fontSize: 25);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Text(surah.englishName, style: title),

            Text(surah.name, style: subtitle),
          ],
        ),

        const SizedBox(height: 5),

        Text('${surah.numberOfAyah} Ayat'),
      ],
    );
  }
}

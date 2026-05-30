import 'package:quran_mobile_app/features/play_audio/data/model/ayah_model.dart';

class SurahDetail {
  final int number;
  final String name;
  final String englishName;
  final int numberOfAyah;
  final List<AyahModel> ayahs;

  SurahDetail({
    required this.number,
    required this.name,
    required this.englishName,
    required this.numberOfAyah,
    required this.ayahs,
  });
}
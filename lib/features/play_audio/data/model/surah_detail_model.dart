import 'package:quran_mobile_app/features/play_audio/data/model/ayah_model.dart';
import 'package:quran_mobile_app/features/play_audio/domain/entities/surah_detail.dart';

class SurahDetailModel {
  final int number;
  final String name;
  final String englishName;
  final int numberOfAyah;
  final List<AyahModel> ayahs;

  SurahDetailModel({
    required this.number,
    required this.name,
    required this.englishName,
    required this.numberOfAyah,
    required this.ayahs,
  });

  factory SurahDetailModel.fromJson(Map<String, dynamic> json) {
    return SurahDetailModel(
      number: json['number'],
      name: json['name'],
      englishName: json['englishName'],
      numberOfAyah: json['numberOfAyahs'],
      ayahs: (json['ayahs'] as List).map((e) => AyahModel.fromJson(e)).toList(),
    );
  }

  SurahDetail toEntity() {
    return SurahDetail(
      number: number,
      name: name,
      englishName: englishName,
      numberOfAyah: numberOfAyah,
      ayahs: ayahs,
    );
  }
}

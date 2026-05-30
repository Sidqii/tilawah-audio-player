import 'package:quran_mobile_app/features/play_audio/domain/entities/surah.dart';

class SurahModel {
  final int number;
  final String name;
  final String englishName;
  final int numberOfAyah;

  SurahModel({
    required this.number,
    required this.name,
    required this.englishName,
    required this.numberOfAyah,
  });

  factory SurahModel.fromJson(Map<String, dynamic> json) {
    return SurahModel(
      number: json['number'],
      name: json['name'],
      englishName: json['englishName'],
      numberOfAyah: json['numberOfAyahs'],
    );
  }

  Surah toEntity() {
    return Surah(
      number: number,
      name: name,
      englishName: englishName,
      numberOfAyah: numberOfAyah,
    );
  }
}

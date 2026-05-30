import 'package:quran_mobile_app/features/play_audio/domain/entities/ayah.dart';

class AyahModel {
  final int number;
  final String audio;
  final String text;

  AyahModel({required this.number, required this.audio, required this.text});

  factory AyahModel.fromJson(Map<String, dynamic> json) {
    return AyahModel(
      number: json['number'],
      audio: json['audio'],
      text: json['text'],
    );
  }

  Ayah toEntity() {
    return Ayah(number: number, audio: audio, text: text);
  }
}

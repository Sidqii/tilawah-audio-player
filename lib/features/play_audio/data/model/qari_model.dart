
import 'package:quran_mobile_app/features/play_audio/domain/entities/qari.dart';

class QariModel {
  final String identifier;
  final String englishName;

  QariModel({
    required this.identifier,
    required this.englishName,
  });

  factory QariModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return QariModel(
      identifier: json['identifier'],
      englishName: json['englishName'],
    );
  }

  Qari toEntity() {
    return Qari(
      identifier: identifier,
      englishName: englishName,
    );
  }
}
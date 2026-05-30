import 'package:quran_mobile_app/features/play_audio/domain/entities/qari.dart';
import 'package:quran_mobile_app/features/play_audio/domain/entities/surah.dart';
import 'package:quran_mobile_app/features/play_audio/domain/entities/surah_detail.dart';

abstract class SurahRepositories {
  Future<List<Surah>> getSurah();

  Future<SurahDetail> getSurahDetail(int number, String qari);

  Future<List<Qari>> getQari();
}

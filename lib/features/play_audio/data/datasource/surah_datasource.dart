import 'package:quran_mobile_app/features/play_audio/data/model/qari_model.dart';
import 'package:quran_mobile_app/features/play_audio/data/model/surah_detail_model.dart';
import 'package:quran_mobile_app/features/play_audio/data/model/surah_model.dart';

abstract class SurahDatasource {
  Future<List<SurahModel>> fetchSurah();

  Future<SurahDetailModel> fetchSurahDetail(int number, String qari);

  Future<List<QariModel>> fetchQaris();
}

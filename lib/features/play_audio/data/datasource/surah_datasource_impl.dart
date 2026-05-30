import 'package:dio/dio.dart';
import 'package:quran_mobile_app/features/play_audio/data/datasource/surah_datasource.dart';
import 'package:quran_mobile_app/features/play_audio/data/model/qari_model.dart';
import 'package:quran_mobile_app/features/play_audio/data/model/surah_detail_model.dart';
import 'package:quran_mobile_app/features/play_audio/data/model/surah_model.dart';

class SurahDatasourceImpl implements SurahDatasource {
  final Dio dio;

  SurahDatasourceImpl(this.dio);

  @override
  Future<List<SurahModel>> fetchSurah() async {
    final response = await dio.get('/surah');

    final List<dynamic> surahs = response.data['data'];

    return surahs.map((e) => SurahModel.fromJson(e)).toList();
  }

  @override
  Future<SurahDetailModel> fetchSurahDetail(int number, String qari) async {
    final response = await dio.get('/surah/$number/$qari');

    return SurahDetailModel.fromJson(response.data['data']);
  }

  @override
  Future<List<QariModel>> fetchQaris() async {
    final response = await dio.get('/edition?format=audio');

    final List<dynamic> qaris = response.data['data'];

    return qaris.map((qari) => QariModel.fromJson(qari)).toList();
  }
}

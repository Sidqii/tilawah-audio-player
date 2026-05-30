import 'package:quran_mobile_app/features/play_audio/data/datasource/surah_datasource.dart';
import 'package:quran_mobile_app/features/play_audio/data/repositories/surah_repositories.dart';
import 'package:quran_mobile_app/features/play_audio/domain/entities/qari.dart';
import 'package:quran_mobile_app/features/play_audio/domain/entities/surah.dart';
import 'package:quran_mobile_app/features/play_audio/domain/entities/surah_detail.dart';

class SurahRepositoriesImpl implements SurahRepositories {
  final SurahDatasource datasource;

  SurahRepositoriesImpl(this.datasource);

  List<Surah>? _surahCache;

  List<Qari>? _qariCache;

  @override
  Future<List<Surah>> getSurah() async {
    if (_surahCache != null) {
      return _surahCache!;
    }

    final result = await datasource.fetchSurah();

    _surahCache = result.map((e) => e.toEntity()).toList();

    return _surahCache!;
  }

  @override
  Future<SurahDetail> getSurahDetail(int number, String qari) async {
    final result = await datasource.fetchSurahDetail(number, qari);

    return result.toEntity();
  }

  @override
  Future<List<Qari>> getQari() async {
    if (_qariCache != null) {
      return _qariCache!;
    }

    final result = await datasource.fetchQaris();

    _qariCache = result.map((e) => e.toEntity()).toList();

    return _qariCache!;
  }
}

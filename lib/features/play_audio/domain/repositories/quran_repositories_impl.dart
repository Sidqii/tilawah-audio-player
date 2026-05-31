import 'package:quran_mobile_app/features/play_audio/data/datasource/quran_datasource.dart';
import 'package:quran_mobile_app/features/play_audio/domain/repositories/quran_repositories.dart';
import 'package:quran_mobile_app/features/play_audio/domain/entities/qari.dart';
import 'package:quran_mobile_app/features/play_audio/domain/entities/surah.dart';
import 'package:quran_mobile_app/features/play_audio/domain/entities/surah_detail.dart';

class QuranRepositoriesImpl implements QuranRepositories {
  final QuranDatasource datasource;

  QuranRepositoriesImpl(this.datasource);

  List<Surah>? _surahCache;

  final Map<String, SurahDetail> _surahDetailCache = {};

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
    final key = '$number-$qari';

    if (_surahDetailCache.containsKey(key)) {
      return _surahDetailCache[key]!;
    }

    final result = await datasource.fetchSurahDetail(number, qari);

    final surahDetail = result.toEntity();

    _surahDetailCache[key] = surahDetail;

    return surahDetail;
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

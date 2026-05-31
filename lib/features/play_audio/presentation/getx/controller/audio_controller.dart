import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:quran_mobile_app/features/play_audio/domain/entities/surah_detail.dart';
import 'package:quran_mobile_app/features/play_audio/domain/repositories/quran_repositories.dart';
import 'package:quran_mobile_app/features/play_audio/presentation/getx/controller/preview_controller.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class AudioController extends GetxController {
  final QuranRepositories repositories;

  AudioController(this.repositories);

  PreviewController get previewController => Get.find<PreviewController>();

  final audio = AudioPlayer();

  final playingAyahIndex = 0.obs;
  final playingSurah = Rxn<SurahDetail>();

  final duration = Rxn<Duration>();
  final position = Duration.zero.obs;

  // TODO: pindah ke LirycsController
  final itemScrollController = ItemScrollController();

  final isPlaying = RxBool(false);

  @override
  void onInit() {
    super.onInit();

    audio.currentIndexStream.listen((index) {
      if (index != null) {
        playingAyahIndex.value = index;

        // TODO: pindahkan auto-scroll lyrics ke LyricsController
        if (itemScrollController.isAttached) {
          itemScrollController.scrollTo(
            index: index,
            alignment: 0.4,
            duration: const Duration(milliseconds: 500),
          );
        }
      }
    });

    audio.playingStream.listen((playing) {
      isPlaying.value = playing;
    });

    audio.durationStream.listen((dur) {
      duration.value = dur;
    });

    audio.positionStream.listen((pos) {
      position.value = pos;
    });

    audio.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        playNext();
      }
    });
  }

  Future<void> loadSurah(SurahDetail surahDetail, String qari) async {
    try {
      playingSurah(surahDetail);

      final sources = surahDetail.ayahs.map((ayah) {
        return AudioSource.uri(
          Uri.parse(ayah.audio),
          tag: MediaItem(
            id: '${surahDetail.number}-${ayah.number}',
            title: '${surahDetail.name} ~ ${surahDetail.englishName}',
            artist: qari,
          ),
        );
      }).toList();

      await audio.setAudioSources(sources);
    } catch (e) {
      print(e);
    }
  }

  Future<void> pauseSurah() async {
    await audio.pause();
  }

  Future<void> nextAyah() async {
    await audio.seekToNext();
  }

  Future<void> prevAyah() async {
    await audio.seekToPrevious();
  }

  Future<void> seekSurah(Duration position) async {
    await audio.seek(position);
  }

  Future<void> playSurah(int surahNumber) async {
    final qariName = previewController.previewQari.value!.identifier;

    final surahDetail = await repositories.getSurahDetail(
      surahNumber,
      qariName,
    );

    final previewSurah = previewController.previewSurah;

    previewSurah.value = previewController.surahList.firstWhere(
      (surah) => surah.number == surahNumber,
    );

    await loadSurah(surahDetail, qariName);

    await audio.play();
  }

  Future<void> playNext() async {
    final surahList = previewController.surahList;

    if (surahList.isEmpty) {
      return;
    }

    final currentSurahNumber = playingSurah.value?.number;

    if (currentSurahNumber == null) {
      return;
    }

    final currentSurahIndex = surahList.indexWhere(
      (item) => item.number == currentSurahNumber,
    );

    if (currentSurahIndex < 0) {
      return;
    }

    if (currentSurahIndex >= surahList.length - 1) {
      return;
    }

    final nextSurah = surahList[currentSurahIndex + 1];

    await playSurah(nextSurah.number);
  }

  Future<void> togglePlay() async {
    if (audio.playing) {
      await audio.pause();
      return;
    }

    if (audio.processingState == ProcessingState.completed) {
      await audio.seek(Duration.zero, index: 0);
    }

    await audio.play();
  }

  @override
  void onClose() {
    audio.dispose();
    super.onClose();
  }
}

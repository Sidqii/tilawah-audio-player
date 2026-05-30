import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quran_mobile_app/features/play_audio/domain/entities/surah_detail.dart';

class AudioController extends GetxController {
  final audio = AudioPlayer();

  final currentAyahIndex = 0.obs;
  final currentSurah = Rxn<SurahDetail>();
  final currentNumber = RxInt(0);

  final duration = Rxn<Duration>();
  final position = Duration.zero.obs;

  final isPlaying = RxBool(false);

  @override
  void onInit() {
    super.onInit();

    audio.currentIndexStream.listen((index) {
      if (index != null) {
        currentAyahIndex.value = index;
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
  }

  Future<void> playSurah(SurahDetail surah) async {
    try {
      currentSurah(surah);
      currentNumber(surah.number);

      final sources = surah.ayahs.map((ayah) {
        return AudioSource.uri(Uri.parse(ayah.audio));
      }).toList();

      await audio.setAudioSources(sources);

      await audio.play();
    } catch (e) {
      print(e);
    }
  }

  Future<void> pauseSurah() async {
    await audio.pause();
  }

  Future<void> resumeSurah() async {
    await audio.play();
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

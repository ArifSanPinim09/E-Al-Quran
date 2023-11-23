import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import '../../../model/detail_surah.dart';
import '../view/alquran_detail_view.dart';

class AlquranDetailController extends GetxController {
  AlquranDetailView? view;

  late AudioPlayer player;

  @override
  void onInit() {
    player = AudioPlayer();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<DetailSurah>? getaudioAyat(String id) async {
    Uri uri = Uri.parse("https://api.quran.gading.dev/surah/$id");
    var respone = await http.get(uri);
    Map<String, dynamic> data =
        (json.decode(respone.body) as Map<String, dynamic>)["data"];
    return DetailSurah.fromJson(data);
  }

  //audio stop
  void stopAudio(Verse audioAyat) async {
    try {
      await player.stop();
      audioAyat.kondisiAudio = "stop";
      update();
    } on PlayerException catch (e) {
      print("Error code: ${e.code}");
      print("Error message: ${e.message}");
    } on PlayerInterruptedException catch (e) {
      print("Connection aborted: ${e.message}");
    } catch (e) {
      print('An error occured: $e');
    }
  }

  //audio resume
  void resumeAudio(Verse audioAyat) async {
    try {
      audioAyat.kondisiAudio = "playing";
      update();
      await player.play();
      audioAyat.kondisiAudio = "stop";
      update();
    } on PlayerException catch (e) {
      print("Error code: ${e.code}");
      print("Error message: ${e.message}");
    } on PlayerInterruptedException catch (e) {
      print("Connection aborted: ${e.message}");
    } catch (e) {
      print('An error occured: $e');
    }
  }

  //audio puse
  void pauseAudio(Verse audioAyat) async {
    try {
      await player.pause();
      audioAyat.kondisiAudio = "pause";
      update();
    } on PlayerException catch (e) {
      print("Error code: ${e.code}");
      print("Error message: ${e.message}");
    } on PlayerInterruptedException catch (e) {
      print("Connection aborted: ${e.message}");
    } catch (e) {
      print('An error occured: $e');
    }
  }

  //audio play
  void playAudio(Verse? audioAyat) async {
    if (audioAyat?.audio.primary != null) {
      try {
        await player.stop();
        await player.setUrl(audioAyat!.audio.primary);
        audioAyat.kondisiAudio = "playing";
        update();
        await player.play();
        audioAyat.kondisiAudio = "stop";
        update();
        await player.stop();
      } on PlayerException catch (e) {
        print("Error code: ${e.code}");
        print("Error message: ${e.message}");
      } on PlayerInterruptedException catch (e) {
        print("Connection aborted: ${e.message}");
      } catch (e) {
        print('An error occured: $e');
      }
    } else {
      print("eror");
    }
  }
}

// import 'dart:convert';
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/simple/list_notifier.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:just_audio/just_audio.dart';
// import '../../../model/detail_surah.dart';
// import '../../alquran_detail/view/alquran_detail_view.dart';

// class AlquranDetailController extends State<AlquranDetailView>
//     implements GetxController {
//   static late AlquranDetailController instance;

//   late AlquranDetailView view;
//   var player = AudioPlayer();

//   @override
//   void initState() {
//     instance = this;
//     super.initState();
//   }

//   @override
//   void dispose() {
//     player.dispose();
//     print("berhenti");
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) => widget.build(context, this);

//   Future<DetailSurah>? getaudioAyat(String id) async {
//     Uri uri = Uri.parse("https://api.quran.gading.dev/surah/$id");
//     var respone = await http.get(uri);
//     Map<String, dynamic> data =
//         (json.decode(respone.body) as Map<String, dynamic>)["data"];
//     return DetailSurah.fromJson(data);
//   }

//   //audio stop
//   void stopAudio(Verse audioAyat) async {
//     try {
//       await player.stop();
//       audioAyat.kondisiAudio = "stop";
//       update();
//     } on PlayerException catch (e) {
//       print("Error code: ${e.code}");
//       print("Error message: ${e.message}");
//     } on PlayerInterruptedException catch (e) {
//       print("Connection aborted: ${e.message}");
//     } catch (e) {
//       print('An error occured: $e');
//     }
//   }

//   //audio resume
//   void resumeAudio(Verse audioAyat) async {
//     try {
//       audioAyat.kondisiAudio = "playing";
//       update();
//       await player.play();
//       audioAyat.kondisiAudio = "stop";
//       update();
//     } on PlayerException catch (e) {
//       print("Error code: ${e.code}");
//       print("Error message: ${e.message}");
//     } on PlayerInterruptedException catch (e) {
//       print("Connection aborted: ${e.message}");
//     } catch (e) {
//       print('An error occured: $e');
//     }
//   }

//   //audio puse
//   void pauseAudio(Verse audioAyat) async {
//     try {
//       await player.pause();
//       audioAyat.kondisiAudio = "pause";
//       update();
//     } on PlayerException catch (e) {
//       print("Error code: ${e.code}");
//       print("Error message: ${e.message}");
//     } on PlayerInterruptedException catch (e) {
//       print("Connection aborted: ${e.message}");
//     } catch (e) {
//       print('An error occured: $e');
//     }
//   }

//   //audio play
//   void playAudio(Verse? audioAyat) async {
//     if (audioAyat?.audio.primary != null) {
//       try {
//         await player.stop();
//         await player.setUrl(audioAyat!.audio.primary);
//         audioAyat.kondisiAudio = "playing";
//         update();
//         await player.play();
//         audioAyat.kondisiAudio = "stop";
//         update();
//         await player.stop();
//       } on PlayerException catch (e) {
//         print("Error code: ${e.code}");
//         print("Error message: ${e.message}");
//       } on PlayerInterruptedException catch (e) {
//         print("Connection aborted: ${e.message}");
//       } catch (e) {
//         print('An error occured: $e');
//       }
//     } else {
//       print("eror");
//     }
//   }

//   @override
//   void $configureLifeCycle() {
//     // TODO: implement $configureLifeCycle
//   }

//   @override
//   Disposer addListener(GetStateUpdate listener) {
//     // TODO: implement addListener
//     throw UnimplementedError();
//   }

//   @override
//   Disposer addListenerId(Object? key, GetStateUpdate listener) {
//     // TODO: implement addListenerId
//     throw UnimplementedError();
//   }

//   @override
//   void disposeId(Object id) {
//     // TODO: implement disposeId
//   }

//   @override
//   // TODO: implement hasListeners
//   bool get hasListeners => throw UnimplementedError();

//   @override
//   // TODO: implement initialized
//   bool get initialized => throw UnimplementedError();

//   @override
//   // TODO: implement isClosed
//   bool get isClosed => throw UnimplementedError();

//   @override
//   // TODO: implement listeners
//   int get listeners => throw UnimplementedError();

//   @override
//   void notifyChildrens() {
//     // TODO: implement notifyChildrens
//   }

//   @override
//   void onClose() {
//     // TODO: implement onClose
//   }

//   @override
//   // TODO: implement onDelete
//   InternalFinalCallback<void> get onDelete => throw UnimplementedError();

//   @override
//   void onInit() {
//     // TODO: implement onInit
//   }

//   @override
//   void onReady() {
//     // TODO: implement onReady
//   }

//   @override
//   // TODO: implement onStart
//   InternalFinalCallback<void> get onStart => throw UnimplementedError();

//   @override
//   void refresh() {
//     // TODO: implement refresh
//   }

//   @override
//   void refreshGroup(Object id) {
//     // TODO: implement refreshGroup
//   }

//   @override
//   void removeListener(VoidCallback listener) {
//     // TODO: implement removeListener
//   }

//   @override
//   void removeListenerId(Object id, VoidCallback listener) {
//     // TODO: implement removeListenerId
//   }

//   @override
//   void update([List<Object>? ids, bool condition = true]) {
//     // TODO: implement update
//   }
// }

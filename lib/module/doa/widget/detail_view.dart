// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:latihan_http/core.dart';
// import '../../../model/surah.dart';

// class AlquranDetailView extends StatefulWidget {
//   final Surah surah;
//   AlquranDetailView({
//     Key? key,
//     required this.surah,
//   }) : super(key: key);

//   Widget build(context, AlquranDetailController controller) {
//     controller.view = this;

//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           // mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "${surah.name.transliteration.id}",
//               style: GoogleFonts.poppins(
//                 fontSize: 26.0,
//                 color: ungu,
//                 fontWeight: FontWeight.w700,
//               ),
//             ),
//             Text(
//               "${surah.revelation.id} - ${surah.name.translation.id} - ${surah.numberOfVerses} Ayat",
//               style: GoogleFonts.poppins(
//                 fontSize: 12.0,
//                 color: ungu,
//                 fontWeight: FontWeight.w400,
//               ),
//             )
//           ],
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: Container(
//               height: 20,
//               width: 20,
//               child: Image(
//                 image: AssetImage(
//                   "assets/images/save1.png",
//                 ),
//                 color: ungu,
//               ),
//             ),
//           ),
//         ],
//         leading: ButtonBack(),
//       ),
//       body: Container(
//         child: FutureBuilder<DetailSurah>(
//           future: controller.getaudioAyat(surah.number.toString()),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(
//                 child: CircularProgressIndicator(
//                   color: ungu,
//                 ),
//               );
//             } else if (!snapshot.hasData) {
//               return Center(
//                 child: Text("404 Notfound"),
//               );
//             } else {
//               return Column(
//                 children: [
//                   SizedBox(
//                     height: 20.0,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 10, right: 10),
//                     child: Container(
//                       width: MediaQuery.of(context).size.width,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         gradient: LinearGradient(
//                           begin: Alignment.centerRight,
//                           end: Alignment.centerLeft,
//                           colors: [
//                             Color(0xff3D4DD8),
//                             Color(0xff9466B1),
//                           ],
//                         ),
//                       ),
//                       child: Padding(
//                         padding: EdgeInsets.all(15),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               "${snapshot.data?.preBismillah?.text.arab}",
//                               style: GoogleFonts.poppins(
//                                 fontSize: 28.0,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w400,
//                               ),
//                             ),
//                             SizedBox(
//                               height: 10.0,
//                             ),
//                             Text(
//                               "${snapshot.data?.preBismillah?.translation.id}",
//                               textAlign: TextAlign.center,
//                               style: GoogleFonts.poppins(
//                                 fontSize: 10.0,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Padding(
//                       padding: EdgeInsets.only(left: 20, right: 20),
//                       child: ListView.builder(
//                         itemCount: snapshot.data?.verses?.length ?? 0,
//                         itemBuilder: (BuildContext context, int index) {
//                           Verse audioAyat = snapshot.data!.verses![index];
//                           return Column(
//                             crossAxisAlignment: CrossAxisAlignment.end,
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Container(
//                                 width: MediaQuery.of(context).size.width,
//                                 height: 96,
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Container(
//                                         height: 40,
//                                         width: 40,
//                                         decoration: BoxDecoration(
//                                           image: DecorationImage(
//                                             image: AssetImage(
//                                               "assets/images/bintang.png",
//                                             ),
//                                           ),
//                                         ),
//                                         child: Center(
//                                             child: Text(
//                                           "${audioAyat.number.inSurah}",
//                                           style: GoogleFonts.poppins(
//                                             fontSize: 15.0,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ))),
//                                     Container(
//                                       child:
//                                           GetBuilder<AlquranDetailController>(
//                                         builder: (c) => Row(
//                                           children: [
//                                             (audioAyat.kondisiAudio == "stop")
//                                                 ? IconButton(
//                                                     onPressed: () {
//                                                       c.playAudio(audioAyat);
//                                                     },
//                                                     icon:
//                                                         Icon(Icons.play_arrow),
//                                                   )
//                                                 : Row(
//                                                     mainAxisSize:
//                                                         MainAxisSize.min,
//                                                     children: [
//                                                       (audioAyat.kondisiAudio ==
//                                                               "playing")
//                                                           ? IconButton(
//                                                               onPressed: () {
//                                                                 c.pauseAudio(
//                                                                     audioAyat);
//                                                               },
//                                                               icon: Icon(
//                                                                   Icons.pause),
//                                                             )
//                                                           : IconButton(
//                                                               onPressed: () {
//                                                                 c.resumeAudio(
//                                                                     audioAyat);
//                                                               },
//                                                               icon: Icon(Icons
//                                                                   .play_circle_filled_rounded),
//                                                             ),
//                                                       IconButton(
//                                                         onPressed: () {
//                                                           c.stopAudio(audioAyat);
//                                                         },
//                                                         icon: Icon(Icons.stop),
//                                                       )
//                                                     ],
//                                                   )
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Text(
//                                 "${audioAyat.text.arab}",
//                                 textAlign: TextAlign.end,
//                                 style: GoogleFonts.notoNaskhArabic(
//                                   fontSize: 27.0,
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.w700,
//                                 ),
//                               ),
//                               // Text("${audioAyat.}"),
//                               SizedBox(
//                                 height: 10.0,
//                               ),
//                               Text(
//                                 "${audioAyat.translation.id}",
//                                 textAlign: TextAlign.end,
//                                 style: GoogleFonts.poppins(
//                                   fontSize: 12.0,
//                                   color: Color(0xff686868),
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                               ),
//                               Divider(),
//                             ],
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }

//   @override
//   State<AlquranDetailView> createState() => AlquranDetailController();
// }

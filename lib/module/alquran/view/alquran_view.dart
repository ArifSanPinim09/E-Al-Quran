import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latihan_http/core.dart';
import '../../../model/surah.dart';
import 'dart:ui' as ui;

class AlquranView extends StatefulWidget {
  AlquranView({
    Key? key,
  }) : super(key: key);

  Widget build(context, AlquranController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Al-Qur'an",
            style: GoogleFonts.poppins(
              fontSize: 26,
              color: ungu,
              fontWeight: FontWeight.w700,
            ),
          ),
          leading: ButtonBack(),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Container(
                height: 20,
                width: 20,
                child: Image(
                  image: AssetImage(
                    "assets/images/save1.png",
                  ),
                  color: ungu,
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Container(
                height: 20,
                width: 20,
                child: Image(
                  image: AssetImage(
                    "assets/images/search.png",
                  ),
                  color: ungu,
                ),
              ),
            ),
          ],
          bottom: PreferredSize(
            child: DefaultTabController(
              length: 2,
              child: Padding(
                padding: EdgeInsets.only(left: 15.0, right: 15.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(20.0)), // Atur warna container
                  child: TabBar(
                    indicatorColor: Color(0xff332885),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 3.0,
                    labelColor: Color(0xff332885),
                    labelStyle: GoogleFonts.poppins(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                    ),
                    tabs: [
                      Tab(text: 'Surah'),
                      Tab(text: 'Juz'),
                    ],
                  ),
                ),
              ),
            ),
            preferredSize: Size.fromHeight(kToolbarHeight),
          )),
      body: Padding(
        padding: EdgeInsets.only(right: 10.0, left: 10.0, top: 10.0),
        child: Container(
          child: FutureBuilder<List<Surah>>(
            future: controller.getDetailSurah(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: CircularProgressIndicator(
                  color: ungu,
                ));
              } else if (snapshot.hasError) {
                return Text("Error!");
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  physics: ScrollPhysics(),
                  itemBuilder: (context, index) {
                    Surah surah = snapshot.data![index];
                    return Column(
                      children: [
                        InkWell(
                          highlightColor: Color(0xffeeecff),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    AlquranDetailView(surah: surah),
                              ),
                            );
                          },
                          child: Container(
                            child: ListTile(
                              leading: Stack(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          "assets/images/bintang.png",
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                        child: Text(
                                      "${surah.number}",
                                      style: GoogleFonts.poppins(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                                  ),
                                ],
                              ),
                              title: Text(
                                "${surah.name.transliteration.id}",
                                style: GoogleFonts.poppins(
                                  color: ungu,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              subtitle: Text(
                                "${surah.revelation.id} - ${surah.name.translation.id} - ${surah.numberOfVerses} Ayat",
                                style: GoogleFonts.poppins(
                                  color: abu,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 8.0,
                                ),
                              ),
                              trailing: Text(
                                "${surah.name.short}",
                                style: GoogleFonts.notoNaskhArabic(
                                  color: ungu,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Divider(color: ungu, height: 10.0),
                      ],
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  State<AlquranView> createState() => AlquranController();
}

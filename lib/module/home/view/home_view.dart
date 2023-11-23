import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latihan_http/core.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  Widget build(context, HomeController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Assalamualikum,Arif",
              style: GoogleFonts.poppins(
                fontSize: 17.0,
                color: ungu,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "Aceh,10 Januari 2023",
              style: GoogleFonts.poppins(
                fontSize: 12.0,
                color: Color(0xff000000),
              ),
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
              size: 24.0,
              color: Color(0xff000000),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AlquranView(),
                        )),
                    child: CardQuranDoa(
                      judul: "Al-Qur'an",
                      image: "assets/images/quran.png",
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DoaView(),
                      ),
                    ),
                    child: CardQuranDoa(
                      judul: "Doa",
                      image: "assets/images/doa.png",
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HadistView(),
                      ),
                    ),
                    child: CardQuranDoa(
                      judul: "Hadis",
                      image: "assets/images/doa.png",
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QiblahView(),
                    )),
                child: CardQuranDoa(
                  judul: "Qiblah",
                  image: "assets/images/doa.png",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<HomeView> createState() => HomeController();
}

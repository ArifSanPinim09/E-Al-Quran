import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latihan_http/core.dart';

class DoaDetailView extends StatefulWidget {
  final Doa doa;
  DoaDetailView({Key? key, required this.doa}) : super(key: key);

  Widget build(context, DoaDetailController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "${doa.doa}",
          style: GoogleFonts.poppins(
            fontSize: 20.0,
            color: ungu,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          Row(
            children: [
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
            ],
          ),
        ],
        leading: ButtonBack(),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                // height: 110.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [
                      Color(0xff3D4DD8),
                      Color(0xff9466B1),
                    ],
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيْم",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 28.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Dengan nama Allah Yang Maha Pengasih, Maha Penyayang.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 10.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add,
                        size: 24.0,
                      ),
                    ),
                    Text(
                      "${doa.ayat}",
                      textAlign: TextAlign.end,
                      style: GoogleFonts.notoNaskhArabic(
                        fontSize: 27.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "${doa.latin}",
                      textAlign: TextAlign.end,
                      style: GoogleFonts.poppins(
                        fontSize: 10.0,
                        color: abu,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 211, 212, 233),
                ),
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Artinya:",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "${doa.artinya}",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 11.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<DoaDetailView> createState() => DoaDetailController();
}

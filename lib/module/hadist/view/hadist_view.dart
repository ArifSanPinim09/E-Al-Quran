import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latihan_http/core.dart';
import '../controller/hadist_controller.dart';

class HadistView extends StatefulWidget {
  const HadistView({Key? key}) : super(key: key);

  Widget build(context, HadistController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Hadist"),
        actions: const [],
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder<List<Hadith>>(
          future: ServiceHadisBukhari().getHBukhari(),
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
                  Hadith isiHadis = snapshot.data![index];
                  return Column(
                    children: [
                      InkWell(
                        highlightColor: Color(0xffeeecff),
                        onTap: () {},
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
                                    "${isiHadis.number}",
                                    style: GoogleFonts.poppins(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                                ),
                              ],
                            ),
                            title: Text(
                              "${isiHadis.arab}",
                              style: GoogleFonts.poppins(
                                color: ungu,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
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
    );
  }

  @override
  State<HadistView> createState() => HadistController();
}

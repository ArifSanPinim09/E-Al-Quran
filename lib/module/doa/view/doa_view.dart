import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latihan_http/core.dart';

class DoaView extends StatefulWidget {
  DoaView({Key? key}) : super(key: key);

  Widget build(context, DoaController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          "Doa",
          style: GoogleFonts.poppins(
            fontSize: 26,
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
          ),
        ],
        leading: ButtonBack(),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
            child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 128.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [
                      Colors.white,
                      Color(0xff6655D0),
                    ],
                  )),
            ),
            const SizedBox(
              height: 10.0,
            ),
            FutureBuilder<List<Doa>>(
              future: ServiceDoa().getDoa(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: ungu,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("404 Not Found!"),
                  );
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: controller.doa.length,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) {
                      Doa itemDoa = controller.doa[index];
                      return Column(
                        children: [
                          const SizedBox(
                            height: 10.0,
                          ),
                          InkWell(
                            highlightColor: Color(0xffeeecff),
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DoaDetailView(
                                    doa: itemDoa,
                                  ),
                                )),
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
                                        itemDoa.id,
                                        style: GoogleFonts.poppins(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      )),
                                    ),
                                  ],
                                ),
                                title: Text(
                                  itemDoa.doa,
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
                  ),
                );
              },
            ),
          ],
        )),
      ),
    );
  }

  @override
  State<DoaView> createState() => DoaController();
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latihan_http/core.dart';

class CardQuranDoa extends StatelessWidget {
  String judul;
  String image;

  CardQuranDoa({
    Key? key,
    required this.judul,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      width: 110.0,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage(image),
                  alignment: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Positioned(
            top: 6,
            left: 0,
            right: 0,
            child: Text(
              judul,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 13.0,
                fontWeight: FontWeight.w600,
                color: ungu,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

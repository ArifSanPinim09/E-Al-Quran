// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:latihan_http/core.dart';

class QiblahWidget extends StatelessWidget {
  const QiblahWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder(
        stream: FlutterQiblah.qiblahStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: ungu,
              ),
            );
          }

          final qiblahDirection = snapshot.data;
          QiblahController.instance.animation = Tween(
                  begin: QiblahController.instance.beginn,
                  end: (qiblahDirection!.qiblah * (pi * 180) * -1))
              .animate(QiblahController.instance.animationController!);
          QiblahController.instance.animationController!.forward(from: 0);

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${qiblahDirection.direction}"),
                Container(
                  child: AnimatedBuilder(
                    animation: QiblahController.instance.animation!,
                    builder: (context, child) => Transform.rotate(
                      angle: QiblahController.instance.animation!.value,
                      child: const Image(
                        image: AssetImage("assets/images/qibla.png"),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:latihan_http/core.dart';
import '../controller/qiblah_controller.dart';

class QiblahView extends StatefulWidget {
  QiblahView({Key? key}) : super(key: key);

  Widget build(context, QiblahController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: Text("Qiblah"),
        actions: [],
      ),
      body: QiblahView(),
    );
  }

  @override
  State<QiblahView> createState() => QiblahController();
}

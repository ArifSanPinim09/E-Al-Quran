import 'package:flutter/material.dart';
import 'package:latihan_http/core.dart';
import '../controller/sholawat_detail_controller.dart';

class SholawatDetailView extends StatefulWidget {
  SholawatDetailView({Key? key}) : super(key: key);

  Widget build(context, SholawatDetailController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: Text("SholawatDetail"),
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }

  @override
  State<SholawatDetailView> createState() => SholawatDetailController();
}

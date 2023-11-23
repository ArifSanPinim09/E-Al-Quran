import 'package:flutter/material.dart';
import 'package:latihan_http/core.dart';
import '../controller/sholawat_controller.dart';

class SholawatView extends StatefulWidget {
  SholawatView({Key? key}) : super(key: key);

  Widget build(context, SholawatController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: Text("Assalamualaikum,Arif"),
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
  State<SholawatView> createState() => SholawatController();
}

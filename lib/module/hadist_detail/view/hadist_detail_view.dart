import 'package:flutter/material.dart';
import 'package:latihan_http/core.dart';
import '../controller/hadist_detail_controller.dart';

class HadistDetailView extends StatefulWidget {
  const HadistDetailView({Key? key}) : super(key: key);

  Widget build(context, HadistDetailController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("HadistDetail"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: const [],
          ),
        ),
      ),
    );
  }

  @override
  State<HadistDetailView> createState() => HadistDetailController();
}

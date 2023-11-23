import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_http/core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
      darkTheme: ThemeData(
        appBarTheme:
            AppBarTheme(backgroundColor: Colors.transparent, elevation: 0),
      ),
    ),
  );
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../model/surah.dart';
import '../view/alquran_view.dart';

class AlquranController extends State<AlquranView> {
  static late AlquranController instance;
  late AlquranView view;

  @override
  void initState() {
    instance = this;

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  Future<List<Surah>>? getDetailSurah() async {
    Uri url = Uri.parse("https://api.quran.gading.dev/surah");
    var response = await http.get(url);
    List data = (json.decode(response.body) as Map<String, dynamic>)["data"];
    if (data == null || data.isEmpty) {
      return [];
    } else {
      return data.map((e) => Surah.fromJson(e)).toList();
    }
  }
}

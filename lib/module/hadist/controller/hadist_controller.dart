import 'package:flutter/material.dart';
import 'package:latihan_http/core.dart';

class HadistController extends State<HadistView> {
  static late HadistController instance;
  late HadistView view;

  @override
  void initState() {
    instance = this;
    tampilkanHadits();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  List isiHadith = [];
  tampilkanHadits() async {
    isiHadith = await ServiceHadisBukhari().getHBukhari();
    setState(() {});
  }
}

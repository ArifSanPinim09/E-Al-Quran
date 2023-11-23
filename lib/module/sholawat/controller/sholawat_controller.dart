import 'package:flutter/material.dart';
import '../view/sholawat_view.dart';

class SholawatController extends State<SholawatView> {
  static late SholawatController instance;
  late SholawatView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}

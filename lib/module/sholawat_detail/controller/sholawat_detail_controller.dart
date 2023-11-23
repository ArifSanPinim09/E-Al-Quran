import 'package:flutter/material.dart';
import '../view/sholawat_detail_view.dart';

class SholawatDetailController extends State<SholawatDetailView> {
  static late SholawatDetailController instance;
  late SholawatDetailView view;

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

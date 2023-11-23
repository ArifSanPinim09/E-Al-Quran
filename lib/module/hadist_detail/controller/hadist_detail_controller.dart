import 'package:flutter/material.dart';
import '../view/hadist_detail_view.dart';

class HadistDetailController extends State<HadistDetailView> {
  static late HadistDetailController instance;
  late HadistDetailView view;

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

import 'package:flutter/material.dart';
import '../view/doa_detail_view.dart';

class DoaDetailController extends State<DoaDetailView> {
  static late DoaDetailController instance;
  late DoaDetailView view;

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

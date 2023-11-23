import 'package:flutter/material.dart';
import 'package:latihan_http/service/service_doa.dart';
import '../../../model/doa.dart';
import '../view/doa_view.dart';

class DoaController extends State<DoaView> {
  static late DoaController instance;
  late DoaView view;

  @override
  void initState() {
    instance = this;
    tampilkanDoa();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  // Future<Doa> getDoa() async {
  //   Uri url = Uri.parse("https://doa-doa-api-ahmadramadhan.fly.dev/api");
  //   var response = await http.get(url);
  //   Map<String, dynamic> data = (json.decode(response.body));
  //   return Doa.fromJson(data);
  //}
  List<Doa> doa = [];

  tampilkanDoa() async {
    doa = await ServiceDoa().getDoa();
    setState(() {});
  }
}

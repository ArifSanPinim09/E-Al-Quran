import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import '../view/qiblah_view.dart';

class QiblahController extends State<QiblahView>
    with SingleTickerProviderStateMixin {
  static late QiblahController instance;
  late QiblahView view;

  @override
  void initState() {
    instance = this;
    getPermision();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animation = Tween(begin: 0.0, end: 0.0).animate(animationController!);
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  Animation<double>? animation;
  AnimationController? animationController;
  double beginn = 0;
  bool permision = false;
  Future getPermision() async {
    if (await Permission.location.serviceStatus.isEnabled) {
      var status = await Permission.location.status;
      if (status.isGranted) {
        permision = true;
      } else {
        Permission.location.request().then((value) {
          setState(() {
            permision = (value == PermissionStatus.granted);
          });
        });
      }
    }
  }
}

import 'package:dio/dio.dart';
import '../model/doa.dart';

class ServiceDoa {
  Future<List<Doa>> getDoa() async {
    try {
      var response = await Dio().get(
        "https://doa-doa-api-ahmadramadhan.fly.dev/api",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
      );

      List<dynamic> doaList = response.data;
      List<Doa> result = doaList.map((data) => Doa.fromJson(data)).toList();
      return result;
    } catch (e) {
      print("Error: $e");
      return [];
    }
  }
}

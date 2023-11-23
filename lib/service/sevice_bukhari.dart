import 'package:dio/dio.dart';
import 'package:latihan_http/core.dart';

class ServiceHadisBukhari {
  Future<List<Hadith>> getHBukhari() async {
    try {
      var response = await Dio().get(
        "https://api.hadith.gading.dev/books/bukhari?range=1-300",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
      );
      Map<String, dynamic> obj = response.data;
      Data data = Data.fromJson(obj['data']); // Dapatkan data dari kunci 'data'
      List<Hadith> result = data.hadiths; // Ambil daftar hadis dari objek Data
      return result;
    } on Exception catch (err) {
      print(err);
      return [];
    }
  }
}

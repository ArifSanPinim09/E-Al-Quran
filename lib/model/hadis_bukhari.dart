import 'dart:convert';

class Bukhari {
  Data data;

  Bukhari({
    required this.data,
  });

  factory Bukhari.fromRawJson(String str) => Bukhari.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Bukhari.fromJson(Map<String, dynamic> json) => Bukhari(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  String name;
  String id;
  int available;
  int requested;
  List<Hadith> hadiths;

  Data({
    required this.name,
    required this.id,
    required this.available,
    required this.requested,
    required this.hadiths,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        id: json["id"],
        available: json["available"],
        requested: json["requested"],
        hadiths: List.from(json["hadiths"].map((x) => Hadith.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "available": available,
        "requested": requested,
        "hadiths": List<dynamic>.from(hadiths.map((x) => x.toJson())),
      };
}

class Hadith {
  int number;
  String arab;
  String id;

  Hadith({
    required this.number,
    required this.arab,
    required this.id,
  });

  factory Hadith.fromRawJson(String str) => Hadith.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Hadith.fromJson(Map<String, dynamic> json) => Hadith(
        number: json["number"],
        arab: json["arab"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "arab": arab,
        "id": id,
      };
}

import 'package:json_parse_kullanimi/filmler_api/filmler.dart';

class FilmlerCevap {
  List<Filmler> filmler;
  int success;
  FilmlerCevap({
    required this.filmler,
    required this.success,
  });

  factory FilmlerCevap.fromJson(Map<String, dynamic> json) {
    var jsonArray = json["filmler"] as List;
    List<Filmler> filmlerListesi =
        jsonArray.map((e) => Filmler.fromJson(e)).toList();

    return FilmlerCevap(
        filmler: filmlerListesi, success: json["success"] as int);
  }
}

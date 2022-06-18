import 'package:dart_dersleri/nesne_tabanli2/filimler.dart';
import 'package:dart_dersleri/nesne_tabanli2/kategoriler.dart';
import 'package:dart_dersleri/nesne_tabanli2/yonetmenler.dart';

void main(){
  var k1 = Kategoriler(kategori_id: 1, kategori_ad: "Dram");
  var k2 = Kategoriler(kategori_id: 2, kategori_ad: "Bilim Kurgu");

  var y1 = Yonetmenler(yonetmen_id: 1, yonetmen_ad: "Quentin Tarantino");
  var y2 = Yonetmenler(yonetmen_id: 2, yonetmen_ad: "Christoper Nolan");

  var f1 = Filimler(film_id: 1, film_ad: "Django", film_yil: 2013, kategori: k1, yonetmen: y1);

  print("Film id : ${f1.film_id}");
  print("Film ad : ${f1.film_ad}");
  print("Film yıl : ${f1.film_yil}");
  print("Film id : ${f1.kategori!.kategori_ad}");
  print("Film id : ${f1.yonetmen!.yonetmen_ad}");









}
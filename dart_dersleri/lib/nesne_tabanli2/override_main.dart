import 'package:dart_dersleri/nesne_tabanli2/hayvan.dart';
import 'package:dart_dersleri/nesne_tabanli2/kedi.dart';
import 'package:dart_dersleri/nesne_tabanli2/kopek.dart';
import 'package:dart_dersleri/nesne_tabanli2/memeli.dart';

void main() {
  var hayvan = Hayvan();
  var memeli = Memeli();
  var kedi = Kedi();
  var kopek = Kopek();

  hayvan.sesCikar();
  memeli.sesCikar();
  kedi.sesCikar();
  kopek.sesCikar();// Hayvan sınıfının metoduna erişir




}

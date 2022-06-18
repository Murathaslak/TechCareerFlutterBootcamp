import 'package:dart_dersleri/nesne_tabanli1/odev2.dart';

void main(List<String> args) {
  var odeviki = Odev2();

  double donenFahrenhiet = odeviki.fahrenhietYap(32);
  print(donenFahrenhiet);

  int donenCevre = odeviki.dikdortgenCevre(4, 5, 5, 4);
  print(donenCevre);

  int donenFaktoriyel = odeviki.faktorielHesapla(4);
  print(donenFaktoriyel);

  int donenHarfSayisi = odeviki.harfSay("osmanmurathaslak","m");
  print(donenHarfSayisi);

  int donenIcAci = odeviki.icAciHesapla(5);
  print(donenIcAci);

  int donenUcret = odeviki.maasHesapla(43);
  print(donenUcret);

  int donenKota = odeviki.kotaUcretHesapla(58);
  print(donenKota);

}

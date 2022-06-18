import 'package:dart_dersleri/nesne_tabanli1/konserve_boyut.dart';

void main(){
  ucretHesapla(100, KonseveBoyut.Orta);
}

void ucretHesapla(int adet,KonseveBoyut boyut) {
  switch (boyut) {
    case KonseveBoyut.Kucuk:
      {
        print("Toplam maliyet : ${30 * adet} Tl");
        break;
      }
    case KonseveBoyut.Orta:
      {
        print("Toplam maliyet : ${80 * adet} Tl");
        break;
      }
    case KonseveBoyut.Buyuk:
      {
        print("Toplam maliyet : ${140 * adet} Tl");
        break;
      }
  }
}
import 'package:dart_dersleri/nesne_tabanli1/araba.dart';

void main(){
  var bmw = Araba(renk: "Mavi", hiz: 200, calisiyorMu: true);
  //print("Renk : ${bmw.renk}, Hız : ${bmw.hiz}, Çalışıyor mu : ${bmw.calisiyorMu}");

  var limuzin = Araba(renk: "Beyaz", hiz: 0, calisiyorMu: false);
  //print("Renk : ${limuzin.renk}, Hız : ${limuzin.hiz}, Çalışıyor mu : ${limuzin.calisiyorMu}");
  
  //bmw.bilgiAl();
  limuzin.bilgiAl();
  limuzin.calistir();
  limuzin.bilgiAl();

  bmw.hizlan(50);

}
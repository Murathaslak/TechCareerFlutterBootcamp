import 'package:dart_dersleri/nesne_tabanli2/ev.dart';
import 'package:dart_dersleri/nesne_tabanli2/saray.dart';
import 'package:dart_dersleri/nesne_tabanli2/villa.dart';


void main(){
  var topkapiSarayi = Saray(10, 200);
  var bogazVilla = Villa(true, 20);

  print(topkapiSarayi.kuleSayisi);
  print(topkapiSarayi.pencereSayisi);

  print(bogazVilla.garajVarmi);
  print(bogazVilla.pencereSayisi);


  if(topkapiSarayi is Saray){
    print("Saraydır");
  }else{
    print("Saray Değildir");
  }

  // Downcasting aşağı yöne doğru dönüşüm
  var ev = Ev(5);
  var saray = ev as Saray;

  // Upcasting yukarı yöne doğru dönüşüm
  var villa = Villa(false, 8);
  var ev2 = villa;




}
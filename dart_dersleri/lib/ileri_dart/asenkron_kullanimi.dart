Future<void> main() async{
  print("Veriler bekleniyor...");
  var veri = await veritabanindanVeriAl();
  print("Veri alınıyor...");
  print("Alınan veri : $veri");
}

Future<String> veritabanindanVeriAl() async{
  for(var i=1;i<=5;i++){
    Future.delayed(Duration(seconds: i),() =>
      print("Alınan veri miktari : %${i*20}"));

  }
  return Future.delayed(Duration(seconds: 5),()=>"Veritabanı veri kümesi");
}
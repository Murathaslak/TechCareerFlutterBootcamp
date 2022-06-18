import 'dart:collection';

void main(){
  // Tanımlama
  // Verileri karışık tutar
  // Aynı veriyi iki kere ekleyemezsin
  var plakalar = HashSet.from([16,23,6]);
  var meyveler = HashSet<String>();

  // Değer atama
  meyveler.add("Kiraz");
  meyveler.add("Muz");
  meyveler.add("Portakal");
  print(meyveler);

  meyveler.add("Muzx");
  print(meyveler);

  String m = meyveler.elementAt(2);
  print("2. indeks : $m");

  for(var m in meyveler){
    print("Sonuç : $m");
  }

  for(var i=0;i<meyveler.length;i++){
    print("$i. => ${meyveler.elementAt(i)}");
  }

  meyveler.remove("Muz");
  print(meyveler);

  meyveler.clear();
  print(meyveler);



}
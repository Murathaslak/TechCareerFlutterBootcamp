void main(){
  // Tanımlama
  var plakalar = [16,23,6];
  var meyveler = <String>[];

  // Veri ekleme
  meyveler.add("Muz"); // 0. indeks
  meyveler.add("Kiraz"); // 1. indeks
  meyveler.add("Elma"); // 2. indeks
  print(meyveler);

  // Güncelleme
  meyveler[1] = "Yeni Kiraz";
  print(meyveler);

  // Insert
  meyveler.insert(1, "Portakal");
  print(meyveler);

  // Veri okuma
  String m = meyveler[3];
  print("3. indeks : $m");

  // For each
  for(var m in meyveler){
    print("Sonuç 1 : $m");
  }

  for(var i=0;i<meyveler.length;i++){
    print("$i. indeksteki veri : ${meyveler[i]}");
  }

  print(meyveler.isEmpty);
  print(meyveler.contains("Muz")); // Muz listemizde var mı yok mu

  var liste = meyveler.reversed;
  print(liste);

  meyveler.sort();
  print(meyveler);

  meyveler.removeAt(1);
  print(meyveler);

  meyveler.clear();
  print(meyveler);













}
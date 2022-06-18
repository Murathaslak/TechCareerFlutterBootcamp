void main(){
  int yas = 19;
  String isim = "Osman";

  if(yas >=18){
   print("Reşitsiniz");
  }else{
    print("Reşit değilsiniz");
  }

  if(isim == "Osman"){
    print("Merhaba Osman");
  }else if(isim == "mehmet"){
    print("Merhaba mehmet");
  }else{
    print("Tanınmayan kişi");
  }

  int sayi1 = 100;
  int sayi2 = 200;

  if(sayi1 > 70 && sayi2 < 300){
    print("And çalıştı");
  }

  if(sayi1 > 50 || sayi2 < 100){
    print("Or çalıştı");
  }

}
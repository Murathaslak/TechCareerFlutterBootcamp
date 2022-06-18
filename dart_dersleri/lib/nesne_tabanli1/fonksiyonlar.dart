class Fonksiyonlar{

  Fonksiyonlar(){
    print("Kurucu metot çalıştı");
  }


  void selamla(){
    String sonuc = "Merhaba Osman";
    print(sonuc);
  }

  String donusluSelam(){
    String sonuc = "Dönüşlü Merhaba Osman";
    return sonuc;
  }

  void selamla2(String isim){
    String sonuc = "Dışardan deger alan isim : $isim";
    print(sonuc);
  }

  int sayilariTopla(int sayi1,int sayi2){
    int toplam = sayi1+sayi2;
    return toplam;
  }





}
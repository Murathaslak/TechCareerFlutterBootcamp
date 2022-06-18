void main(){
  String str = "Hello";

  String? isim = null;

  isim = "Ahmet";

  // Yöntem 1 : ? null ise uygulama çökmez, null değilse çalışır
  print("Sonuç 1 : ${isim?.toUpperCase()}");

  // Yöntem 2 : ! sorun olmayacağını belirtmektedir ama risklidir, uygulama çökebilir.
  print("Sonuç 2 : ${isim!.toUpperCase()}");

  // Yöntem 3 : if kontrol
  if(isim != null){
    print("Sonuç 3 : ${isim.toUpperCase()}");
  }else{
    print("isim null ve işlem yapılmadı");
  }



}
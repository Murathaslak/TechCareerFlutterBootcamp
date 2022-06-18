class Araba{
  String renk;
  int hiz;
  bool calisiyorMu;

  Araba({required this.renk,required this.hiz,required this.calisiyorMu});

  void bilgiAl(){
    print("*****************************");
    print("Renk : $renk, Hız : $hiz, Çalışıyor mu : $calisiyorMu");
  }

  void calistir(){ // side effect fonksiyonla sınıf içerisindeki değerleri değiştirme
    calisiyorMu = true;
    hiz = 5;
  }

  void durdur(){
    calisiyorMu = false;
    hiz = 0;
  }

  void hizlan(int kacKm){
    //hiz = hiz + kacKm;
    hiz+=kacKm;
  }

  void yavasla(int kacKm){
    hiz = hiz + kacKm;
  }




}
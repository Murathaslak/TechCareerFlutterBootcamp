class Odev2 {

  double fahrenhietYap(int derece) {
    double sonuc = derece * (1.8) + 32;
    return sonuc;
  }

  int dikdortgenCevre(int kenar1, int kenar2, int kenar3, int kenar4) {
    int sonuc = kenar1 + kenar2 + kenar3 + kenar4;
    return sonuc;
  }

  int faktorielHesapla(int faktoriel) {
    int deger = 1;
    for(int i=1;i<faktoriel;i++){
      deger = deger * (i+1);
    }
    return deger;
  }

  int harfSay(String kelime, String harf) {
    var arr = kelime.split(harf);
    return arr.length-1;
  }

  int icAciHesapla(int kenarSayisi) {
    int aci = (kenarSayisi-2)*180;
    return aci;
  }

  int maasHesapla(int gunSayisi) {
    int ekMesai;
    int mesai;
    int sonuc;
    int saatUcret = 10;
    int gunlukSaat = 8;
    int totalMesai = gunSayisi*gunlukSaat;
    if(totalMesai-160>0)
      {
        mesai =160*saatUcret;
        ekMesai=(totalMesai - 160)*20;
        sonuc = mesai+ekMesai;
      }else{
      var mesaisizUcret = totalMesai*10 ;
      return mesaisizUcret;
    }
    return sonuc;
  }

  int kotaUcretHesapla(int gelenKota) {
    int sonuc;
    if(gelenKota<=50){
      return 100;
    }else{
      sonuc = (gelenKota-50)*4;
      sonuc = sonuc + 100;
    }
    return sonuc;
  }
}

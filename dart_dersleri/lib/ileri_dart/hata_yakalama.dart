void main() {
  var liste = <String>[];
  liste.add("Ahmet");
  liste.add("Zeynep");

  try {
    String isim = liste[2];
    print("Gelen isim : $isim");
  } catch (e) {
    print(e);
    print("Listenin boyunutunu aştınız");
  }
}

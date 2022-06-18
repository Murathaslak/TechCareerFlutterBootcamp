import 'package:kisiler_uygulamasi/entity/kisiler.dart';
import 'package:kisiler_uygulamasi/sqlite/veritabani_yardimcisi.dart';

class KisilerDaoRepository {
  Future<void> kisiKayit(String kisi_ad, String kisi_tel) async {
    var db = await VeritabaniYardimci.veritabaniErisim();
    var bilgiler = Map<String, dynamic>();
    bilgiler["kisi_ad"] = kisi_ad;
    bilgiler["kisi_tel"] = kisi_tel;
    await db.insert("kisiler", bilgiler);
  }

  Future<void> kisiGuncelle(
      int kisi_id, String kisi_ad, String kisi_tel) async {
    var db = await VeritabaniYardimci.veritabaniErisim();
    var bilgiler = Map<String, dynamic>();
    bilgiler["kisi_ad"] = kisi_ad;
    bilgiler["kisi_tel"] = kisi_tel;
    await db.update("kisiler", bilgiler,
        where: "kisi_id = ?", whereArgs: [kisi_id]);
  }

  Future<List<Kisiler>> tumKisileriAl() async {
    var db = await VeritabaniYardimci.veritabaniErisim();
    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM kisiler");

    return List.generate(maps.length, (index) {
      var satir = maps[index];
      return Kisiler(
          kisi_id: satir["kisi_id"],
          kisi_ad: satir["kisi_ad"],
          kisi_tel: satir["kisi_tel"]);
    });
  }

  Future<List<Kisiler>> kisiAra(String aramaKelimesi) async {
    var db = await VeritabaniYardimci.veritabaniErisim();
    List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT * FROM kisiler Where kisi_ad like '%$aramaKelimesi%'");

    return List.generate(maps.length, (index) {
      var satir = maps[index];
      return Kisiler(
          kisi_id: satir["kisi_id"],
          kisi_ad: satir["kisi_ad"],
          kisi_tel: satir["kisi_tel"]);
    });
  }

  Future<void> kisiSil(int kisi_id) async {
    var db = await VeritabaniYardimci.veritabaniErisim();
    await db.delete("kisiler",where: "kisi_id = ?",whereArgs: [kisi_id]);
  }
}

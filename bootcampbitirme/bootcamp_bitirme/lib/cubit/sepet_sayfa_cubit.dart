// ignore_for_file: non_constant_identifier_names

import 'package:bootcamp_bitirme/entity/sepet_yemekler.dart';
import 'package:bootcamp_bitirme/repo/yemeklerdao_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SepetSayfaCubit extends Cubit<List<SepetYemekler>> {
  SepetSayfaCubit() : super(<SepetYemekler>[]);

  var yrepo = YemeklerDaoRepo();

  Future<void> sepetYukle(String kullanici_adi) async {
    var liste = await yrepo.sepettekiYemekleriAl(kullanici_adi);
    emit(liste);
  }

  Future yemekSil(String sepet_yemek_id, String kullanici_adi) async {
    await yrepo.sepetYemekSil(sepet_yemek_id, kullanici_adi);
    await sepetYukle(kullanici_adi);
  }
}

class SepetSayfaCubitIslem extends Cubit<int> {
  SepetSayfaCubitIslem() : super(0);

  void islem(islem) {
    emit(islem);
  }
}


import 'package:bootcamp_bitirme/entity/yemekler.dart';
import 'package:bootcamp_bitirme/repo/yemeklerdao_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class YemekListeCubit extends Cubit<List<Yemekler>> {
  YemekListeCubit() : super(<Yemekler>[]);

  var yrepo = YemeklerDaoRepo();

  Future<void> yemekleriYukle() async {
    var liste = await yrepo.tumYemekleriAl();
    emit(liste);
  }
}

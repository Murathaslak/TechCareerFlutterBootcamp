import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/entity/yapilacak.dart';
import 'package:todoapp/repo/yapilacaklardao_repository.dart';


class AnasayfaCubit extends Cubit<List<Yapilacak>> {
  AnasayfaCubit() : super(<Yapilacak>[]);

  var yrepo = YapilacakDaoRepository();

  Future<void> yapilacaklariYukle() async {
    var liste = await yrepo.tumYapilacaklariAl();
    emit(liste);
  }

  Future<void> ara(String aramaKelimesi) async {
    var liste = await yrepo.yapilacakAra(aramaKelimesi);
    emit(liste);
  }

  Future<void> sil(int yapilacak_id) async {
    await yrepo.yapilacakSil(yapilacak_id);
    await yapilacaklariYukle();
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/repo/yapilacaklardao_repository.dart';


class KayitCubit extends Cubit<void> {
  KayitCubit() : super(0);

  var krepo = YapilacakDaoRepository();

  Future<void> kayit(String kisi_ad, String kisi_tel) async {
    await krepo.yapilacakKayit(kisi_tel);
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/repo/yapilacaklardao_repository.dart';


class DetayCubit extends Cubit<void> {
  DetayCubit() : super(0);

  var yrepo = YapilacakDaoRepository();

  Future<void> guncelle(int yapilacak_id, String yapilacak_is) async {
    await yrepo.yapilacakGuncelle(yapilacak_id, yapilacak_is);
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc_listeleme/kisiler_durum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_listeleme/kisiler_dao_repository.dart';

class KisilerCubit extends Cubit<KisilerDurum> {
  KisilerRepository kisilerRepository;
  KisilerCubit(this.kisilerRepository) : super(KisilerBaslangisSinifi());

  Future<void> kisileriAlveGetir() async {
    try {
      var kisiListeCevap = await kisilerRepository.kisileriGetir();

      emit(KisilerYuklendi(kisiListeCevap));
    } catch (e) {
      emit(KisilerHata("Tekrar dene canim"));
    }
  }
}

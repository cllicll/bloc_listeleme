import 'package:bloc_listeleme/kisiler_model.dart';

abstract class KisilerRepository {
  Future<List<Kisiler>> kisileriGetir();
}

class KisilerDaoRepository implements KisilerRepository {
  @override
  Future<List<Kisiler>> kisileriGetir() async {
    var kisiListesi = <Kisiler>[];

    var k1 = Kisiler("1", "Celal", "+190056895247");
    var k2 = Kisiler("2", "Berk", "+190056895588247");
    var k3 = Kisiler("3", "dkkdkd", "+155556895247");

    kisiListesi.add(k1);
    kisiListesi.add(k2);
    kisiListesi.add(k3);

    return kisiListesi;
  }
}

import 'kisiler_model.dart';

abstract class KisilerDurum {
  KisilerDurum();
}

class KisilerBaslangisSinifi extends KisilerDurum {
  KisilerBaslangisSinifi();
}

class KisilerYuklendi extends KisilerDurum {
  List<Kisiler> kisiListesi;
  KisilerYuklendi(this.kisiListesi);
}

class KisilerHata extends KisilerDurum {
  String hataMesaji;
  KisilerHata(this.hataMesaji);
}

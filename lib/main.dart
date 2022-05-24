import 'package:bloc_listeleme/kisiler_dao_repository.dart';
import 'package:bloc_listeleme/kisiler_durum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'kisiler_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => KisilerCubit(KisilerDaoRepository())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bloc Listeleme',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Anasayfa(),
      ),
    );
  }
}

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  void initState() {
    super.initState();
    context.read<KisilerCubit>().kisileriAlveGetir();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Bloc Listeleme")),
        body: BlocBuilder<KisilerCubit, KisilerDurum>(
            builder: ((context, kisilerDurum) {
          if (kisilerDurum is KisilerYuklendi) {
            var kisiListesi = kisilerDurum.kisiListesi;

            return ListView.builder(
              itemCount: kisiListesi.length,
              itemBuilder: (context, index) {
                var kisi = kisiListesi[index];

                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 50,
                      child: Row(children: [
                        Text("${kisi.kisi_ad} - ${kisi.kisi_tel}")
                      ]),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center();
          }
        })));
  }
}

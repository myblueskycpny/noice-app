import 'package:flutter/material.dart';
import 'package:noice/login.dart';
import 'package:noice/pertama/episodeterbaru.dart';
import 'package:noice/pertama/noiceclips.dart';
import 'package:noice/pertama/subjudul.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text(
            'PODCAST AREA',
            style: TextStyle(
                fontWeight: FontWeight.w500, color: Colors.white, fontSize: 20),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.exit_to_app_outlined),
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove('isUser');
                final result = await Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const Login()),
                );
                prefs.remove('id');
                Navigator.pushReplacementNamed(context, '/login');
                if (result != null) {
                  setState(() {});
                }
              },
            )
          ],
        ),
        body: Stack(
          alignment: Alignment.topLeft,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .5,
            ),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: SafeArea(
                  child: Column(
                    children: [
                      const SizedBox(
                        width: double.infinity,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            const subJudul(title: 'NOICE CLIPS'),
                            const Padding(padding: EdgeInsets.only(top: 10)),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              child: SizedBox(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    NoiceClips(
                                        name: 'KASTURI',
                                        linkImage:
                                            'https://images.noice.id/catalog/content-1650270970438'),
                                    NoiceClips(
                                        name: 'TRIO KURNIA',
                                        linkImage:
                                            'https://images.noice.id/catalog/content-1649669830046'),
                                    NoiceClips(
                                        name: 'TSAMA DENGAN',
                                        linkImage:
                                            'https://images.noice.id/catalog/content-1649666765198'),
                                    NoiceClips(
                                        name: 'ROMANCE DAWN',
                                        linkImage:
                                            'https://images.noice.id/catalog/content-1642677254209.jpg'),
                                    NoiceClips(
                                        name: 'UDIK',
                                        linkImage:
                                            'https://images.noice.id/catalog/content-1646649290475'),
                                    NoiceClips(
                                        name: 'MUSUH MASYARAKAT',
                                        linkImage:
                                            'https://images.noice.id/catalog/content-1649319956365'),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            const subJudul(title: 'LANJUT DENGERIN'),
                            const Padding(padding: EdgeInsets.only(top: 10)),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              child: SizedBox(
                                child: Row(
                                  children: const [
                                    EpisodeTerbaru(
                                        name:
                                            'Eps 33: Kami Mendukung Perdagangan Manusia',
                                        linkImage:
                                            'https://images.noice.id/catalog/content-1636285415309.jpg'),
                                    EpisodeTerbaru(
                                        name:
                                            'Terus Kenapa Mesti Iri Liat Temen Lebih Sukses?',
                                        linkImage:
                                            'https://images.noice.id/catalog/content-1649668004868'),
                                    EpisodeTerbaru(
                                        name:
                                            'Speak Up dalam Pelecehan Seksual',
                                        linkImage:
                                            'https://images.noice.id/catalog/content-1649748886887'),
                                    EpisodeTerbaru(
                                        name: 'Eps 15: Cuma Nyicip Ajah',
                                        linkImage:
                                            'https://images.noice.id/catalog/content-1650049365636'),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            const subJudul(title: 'EPISODE TERBARU'),
                            const Padding(padding: EdgeInsets.only(top: 10)),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              child: Row(
                                children: const [
                                  EpisodeTerbaru(
                                      name: 'Eps 72: Aksi Gila Demi Uang',
                                      linkImage:
                                          'https://images.noice.id/catalog/content-1650437646220'),
                                  EpisodeTerbaru(
                                      name:
                                          'Penunggu Kamar Belakang & Jin Rumah Nenek',
                                      linkImage:
                                          'https://images.noice.id/catalog/content-1650429038504'),
                                  EpisodeTerbaru(
                                      name:
                                          'Cara Kreatif Pejabat Naikin Elektabilitas Jelang Pemilu',
                                      linkImage:
                                          'https://images.noice.id/catalog/content-1650428291511'),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

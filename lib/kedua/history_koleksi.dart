import 'package:flutter/material.dart';
import 'listCustom.dart';

class HistoryKoleksi extends StatefulWidget {
  const HistoryKoleksi({Key? key}) : super(key: key);

  @override
  State<HistoryKoleksi> createState() => _HistoryKoleksiState();
}

class _HistoryKoleksiState extends State<HistoryKoleksi> {
  String currentEpisode = "";
  String currentNama = "";
  String currentWaktu = "";
  String currentCover = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: const Color(0xFF000000),
          appBar: AppBar(
            leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
            backgroundColor: Colors.black,
            title: const Text(
              "HISTORY",
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: podcastList.length,
                    itemBuilder: (context, index) => listCustom(
                          onTap: () {
                            setState(() {
                              currentEpisode = podcastList[index]['episode'];
                              currentNama = podcastList[index]['nama'];
                              currentWaktu = podcastList[index]['waktu'];
                              currentCover = podcastList[index]['cover'];
                            });
                          },
                          episode: podcastList[index]['episode'],
                          nama: podcastList[index]['nama'],
                          waktu: podcastList[index]['waktu'],
                          cover: podcastList[index]['cover'],
                        )),
              ),
              Container(
                decoration:
                    const BoxDecoration(color: Colors.white38, boxShadow: [
                  BoxShadow(
                    color: Color(0x55212121),
                    blurRadius: 8.0,
                  )
                ]),
                child: Column(
                  children: [
                    Slider.adaptive(value: 0.0, onChanged: (value) {}),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 8.0, left: 12.0, right: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 80.0,
                            width: 80.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                image: DecorationImage(
                                    image: NetworkImage(currentCover))),
                          ),
                          const SizedBox(width: 10.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  currentEpisode,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 5.0),
                                Text(
                                  currentNama,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10.0,
                                  ),
                                ),
                                Text(
                                  currentWaktu,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 9.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite_border,
                              color: Colors.red,
                              size: 30.0,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            iconSize: 50.0,
                            icon: const Icon(Icons.play_arrow_outlined),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}

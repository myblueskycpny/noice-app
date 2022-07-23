import 'package:flutter/material.dart';
import 'package:noice/kedua/favorite_koleksi.dart';
import 'package:noice/kedua/playlistStuff/playlist.dart';
import 'package:noice/kedua/sound/soundpage.dart';
import 'history_koleksi.dart';

class KoleksiNoice extends StatefulWidget {
  const KoleksiNoice({Key? key}) : super(key: key);

  @override
  State<KoleksiNoice> createState() => _KoleksiNoiceState();
}

class _KoleksiNoiceState extends State<KoleksiNoice> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF000000),
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text(
            'KOLEKSI',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              "   Lanjut dengerin",
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(
                  width: 17,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      'https://cdn.discordapp.com/attachments/916981383371563038/957868504894279681/noice-original.jpeg',
                      height: 180,
                      width: 180,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Eps 1: balik bandung',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'EXSCLUSIVE',
                      style: TextStyle(color: Colors.white70, fontSize: 9.0),
                    )
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      'https://cdn.discordapp.com/attachments/916981383371563038/957888026619559966/ERB1ZeBUEAEbp_p.jpg',
                      height: 180,
                      width: 180,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Eps 2: BERCANDA ISINYA MUSIK',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'BERIZIKKK',
                      style: TextStyle(color: Colors.white70, fontSize: 9.0),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 23,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final result = await Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const HistoryKoleksi()),
                    );
                    if (result != null) {
                      setState(() {});
                    }
                  },
                  child: list("HISTORY"),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10)),
                    backgroundColor: MaterialStateProperty.all(Colors.white70),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final result =
                        await Navigator.pushNamed(context, '/favoritelist');
                    if (result != null) {
                      setState(() {});
                    }
                  },
                  child: list("KONTEN DISUKAI"),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10)),
                    backgroundColor: MaterialStateProperty.all(Colors.white38),
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final result = await Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (_) => const FavoriteKoleksi()),
                    );
                    if (result != null) {
                      setState(() {});
                    }
                  },
                  child: list("DOWNLOAD"),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10)),
                    backgroundColor: MaterialStateProperty.all(Colors.white38),
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final result = await Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const soundPage()),
                    );
                    if (result != null) {
                      setState(() {});
                    }
                  },
                  child: list("PODCAST"),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10)),
                    backgroundColor: MaterialStateProperty.all(Colors.white38),
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final result = await Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const HistoryKoleksi()),
                    );
                    if (result != null) {
                      setState(() {});
                    }
                  },
                  child: list("RADIO"),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10)),
                    backgroundColor: MaterialStateProperty.all(Colors.white38),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final result = await Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const playlist()),
                    );
                    if (result != null) {
                      setState(() {});
                    }
                  },
                  child: list("PLAYLIST"),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10)),
                    backgroundColor: MaterialStateProperty.all(Colors.white70),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget list(String title) {
  return Row(
    children: [
      Text(
        title,
        style: const TextStyle(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
      ),
    ],
  );
}

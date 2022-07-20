class FavoriteListModel {
  static List<String> itemEpisode = [
    'EPS 31: SEKOLAH TIDAK PENTING',
    'EPS 39: BERDOA TIDAK ADA GUNANYA',
    'EPS 30: MENJADI CEPU SAH-SAH SAJA',
    'EPS 16 : MARAH ITU WAJIB DIBIASAKAN',
  ];

  static List<String> itemName = [
    'MUSUH MASYARAKAT',
    'MUSUH MASYARAKAT',
    'MUSUH MASYARAKAT',
    'MUSUH MASYARAKAT',
  ];

  static List<String> itemTime = [
    '41 menit',
    '39 menit',
    '48 menit',
    '41 menit',
  ];

  static List<String> itemUrl = [
    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOVP.2OeC_tQGmsfD7JA89G9higEsDh%26pid%3DApi&f=1',
    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOVP.m4pCWQIWC8YAorq6NbYkdAEsDh%26pid%3DApi&f=1',
    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOVP.Y1af4ayBAjVXoXvdcDssfAEsDh%26pid%3DApi&f=1',
    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOVP.P0VTEZao1RhnJ378j_KvSQEsDh%26pid%3DApi&f=1',
  ];
  Item getById(int id) => Item(
        id,
        itemEpisode[id % itemEpisode.length],
        itemName[id % itemName.length],
        itemTime[id % itemTime.length],
        itemUrl[id % itemUrl.length],
      );

  Item getByPosition(int position) {
    return getById(position);
  }
}

class Item {
  final int id;
  final String episode;
  final String name;
  final String time;
  final String url;

  const Item(
    this.id,
    this.episode,
    this.name,
    this.time,
    this.url,
  );

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}

import 'package:flutter/material.dart';

Widget listCustom(
    {required String episode,
    required String nama,
    required String waktu,
    required String cover,
    onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            height: 100.0,
            width: 110.0,
            decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(16.0),
                image: DecorationImage(image: NetworkImage(cover))),
          ),
          const SizedBox(width: 10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                episode,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                maxLines: 1,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 9.0),
              Text(
                nama,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10.0,
                ),
              ),
              Text(
                waktu,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 9.0,
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}

List podcastList = [
  {
    'episode': 'EPS 31: SEKOLAH TIDAK PENTING',
    'nama': 'MUSUH MASYARAKAT',
    'waktu': '41 menit',
    'cover':
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOVP.2OeC_tQGmsfD7JA89G9higEsDh%26pid%3DApi&f=1',
  },
  {
    'episode': 'EPS 39: BERDOA TIDAK ADA GUNANYA',
    'nama': 'MUSUH MASYARAKAT',
    'waktu': '39 menit',
    'cover':
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOVP.m4pCWQIWC8YAorq6NbYkdAEsDh%26pid%3DApi&f=1',
  },
  {
    'episode': 'EPS 30: MENJADI CEPU SAH-SAH SAJA',
    'nama': 'MUSUH MASYARAKAT',
    'waktu': '48 menit',
    'cover':
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOVP.Y1af4ayBAjVXoXvdcDssfAEsDh%26pid%3DApi&f=1',
  },
  {
    'episode': 'EPS 16 : MARAH ITU WAJIB DIBIASAKAN',
    'nama': 'MUSUH MASYARAKAT',
    'waktu': '41 menit',
    'cover':
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOVP.P0VTEZao1RhnJ378j_KvSQEsDh%26pid%3DApi&f=1',
  },
];

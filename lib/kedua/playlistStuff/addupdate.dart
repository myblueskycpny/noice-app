import 'package:flutter/material.dart';
import 'package:noice/kedua/playlistStuff/widget.dart';
import 'package:noice/kedua/playlistStuff/functionList.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class tambahUpdate extends StatelessWidget {
  final String judul;
  final tipeData? data;
  const tambahUpdate({
    Key? key,
    required this.judul,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController inputData = TextEditingController();
    if (data != null) {
      inputData.text = data!.data;
    }
    return AlertDialog(
      title: Text(judul),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: inputData,
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  isDense: true,
                  fillColor: Colors.grey,
                  labelText: "list",
                  hintText: "MASUKKAN PLAYLIST"),
            )
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              if (inputData.text.isEmpty) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const widgetSet(
                        title: "error!",
                        content: "error nama tidak boleh kosong");
                  },
                );
              } else {
                if (data != null) {
                  Provider.of<CRUD>(context, listen: false)
                      .ganti(
                          tipeData(id: data!.id, data: inputData.text));
                } else {
                  const uuid = Uuid();
                  Provider.of<CRUD>(context, listen: false).tambah(
                    tipeData(
                      id: uuid.v4(),
                      data: inputData.text,
                    ),
                  );
                }
                Navigator.pop(context);
              }
            },
            child: const Text("simpan")),
      ],
    );
  }
}

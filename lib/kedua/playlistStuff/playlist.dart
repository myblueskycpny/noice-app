import 'package:flutter/material.dart';
import 'package:noice/kedua/playlistStuff/addupdate.dart';
import 'package:noice/kedua/playlistStuff/functionList.dart';
import 'package:provider/provider.dart';

class playlist extends StatelessWidget {
  const playlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF000000),
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text(
            'PLAYLIST NOTE',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Consumer<CRUD>(builder: (
          context,
          todoProvider,
          child,
        ) {
          return ListView(
            padding: const EdgeInsets.all(20.0),
            children: todoProvider.playlist.isNotEmpty
                ? todoProvider.playlist.map((todo) {
                    return Dismissible(
                      key: Key(todo.id),
                      background: Container(
                        color: Colors.amber,
                        child: const Center(
                            child: Text(
                          "hapus",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                      ),
                      child: Card(
                        child: ListTile(
                          title: Text(todo.data),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return tambahUpdate(
                                    judul: "edit nama playlist",
                                    data: todo,
                                  );
                                });
                          },
                        ),
                      ),
                      onDismissed: (direction) {
                        Provider.of<CRUD>(
                          context,
                          listen: false,
                        ).hapus(todo);
                      },
                    );
                  }).toList()
                : [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: const Center(
                        child: Text(
                          "PLAYLIST KOSONG",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
          );
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return const tambahUpdate(judul: "tambah");
                });
          },
          child: const Icon(
              Icons.add
          ),
        ),
      ),
    );
  }
}

import 'package:noice/favourite/models/favpage_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This gets the current state of FavoritePageModel and also tells Flutter
    // to rebuild this widget when FavoritePageModel notifies listeners (in other words,
    // when it changes).
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'KONTEN DISUKAI',
        ),
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                // to call FavoritePageList widget //
                child: _FavoritePageList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// UI of FavoritePageList //
class _FavoritePageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var itemNameStyle = Theme.of(context).textTheme.headline6;
    // This gets the current state of FavoritePageModel and also tells Flutter
    // to rebuild this widget when FavoritePageModel notifies listeners (in other words,
    // when it changes).
    var favoritepage = context.watch<FavoritePageModel>();

    return ListView.builder(
      itemCount: favoritepage.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: Image.network(favoritepage.items[index].url),
        trailing: IconButton(
          icon: const Icon(
            Icons.delete,
            color: Colors.white,
          ),
          // code to remove the favorite list //
          onPressed: () {
            favoritepage.remove(favoritepage.items[index]);
          },
        ),
        title: Text(
          favoritepage.items[index].name,
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          favoritepage.items[index].episode,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ),
    );
  }
}

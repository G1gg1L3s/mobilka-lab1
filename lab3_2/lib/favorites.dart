import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab3_2/models/favorites.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Favorites'),
        ),
        body: Consumer<Favorites>(
            builder: (context, value, child) => ListView.builder(
                  itemCount: value.colors.length,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  itemBuilder: (context, index) =>
                      FavoriteItemTile(value.colors.elementAt(index)),
                )));
  }
}

class FavoriteItemTile extends StatelessWidget {
  final Color color;

  FavoriteItemTile(this.color);

  @override
  Widget build(BuildContext context) {
    var c = color.value.toRadixString(16).padLeft(6, '0');

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
        ),
        title: Text(
          '#$c',
        ),
        trailing: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Provider.of<Favorites>(context, listen: false).remove(color);
          },
        ),
      ),
    );
  }
}

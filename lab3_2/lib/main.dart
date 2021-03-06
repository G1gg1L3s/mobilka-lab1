import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lab3_2/favorites.dart';
import 'package:provider/provider.dart';

import 'models/favorites.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Favorites>(
        create: (context) => Favorites(),
        child: MaterialApp(
          title: 'Lab3-2',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color picker'),
        actions: <Widget>[
          TextButton.icon(
            style: TextButton.styleFrom(primary: Colors.white),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FavoritesPage()));
            },
            icon: Icon(Icons.favorite),
            label: Text('Favorites'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 100,
        cacheExtent: 20.0,
        controller: ScrollController(),
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (context, index) => ItemTile(),
      ),
    );
  }
}

class ItemTile extends StatelessWidget {
  final Color color = ColorGen.next();

  @override
  Widget build(BuildContext context) {
    var favorites = Provider.of<Favorites>(context);
    var isFav = favorites.contains(color);

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
          icon: isFav ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
          onPressed: () =>
              isFav ? favorites.remove(color) : favorites.add(color),
        ),
      ),
    );
  }
}

class ColorGen {
  static Random rng = new Random();
  static Color next() => Color.fromARGB(
      0xff, rng.nextInt(0xff), rng.nextInt(0xff), rng.nextInt(0xff));
}

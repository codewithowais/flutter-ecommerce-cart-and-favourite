import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FavouriteView extends StatelessWidget {
  List<Map> favproduct;
  FavouriteView({super.key, required this.favproduct});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourites"),
      ),
      body: ListView.builder(
          itemCount: favproduct.length,
          itemBuilder: (context, ind) {
            return ListTile(
              title: Text(favproduct[ind]['name']),
            );
          }),
    );
  }
}

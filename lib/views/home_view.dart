import 'package:eccommerce/views/favourite_view.dart';
import 'package:flutter/material.dart';

import '../data/data.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

// List<Map> products = [
//   {'id': 1, 'name': 'airbuds', 'price': 5000, 'isfavourite': false},
//   {'id': 2, 'name': 'headphones', 'price': 4220, 'isfavourite': false},
//   {'id': 3, 'name': 'mobile', 'price': 54882, 'isfavourite': false},
//   {'id': 4, 'name': 'charger', 'price': 754, 'isfavourite': false},
//   {'id': 5, 'name': 'Datacable', 'price': 565, 'isfavourite': false},
//   {'id': 6, 'name': 'Mouse', 'price': 200, 'isfavourite': false},
//   {'id': 7, 'name': 'Battery', 'price': 500, 'isfavourite': false},
// ];
// bool isfavourite = false;
List<Map> favouriteproduct = [];
List<Map> cartProducts = [];

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: ((context, index) {
          return ListTile(
            title: Text(products[index]['name']),
            subtitle: Text("${products[index]['price']}"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                    onTap: () {
                      print(products[index]);
                      cartProducts.add(products[index]);
                      print(cartProducts);
                    },
                    child: Icon(Icons.shopping_basket_outlined)),
                InkWell(
                    onTap: () {
                      if (!products[index]['isfavourite']) {
                        // favouriteproduct.add(products[index]);
                        setState(() {
                          products[index]['isfavourite'] = true;
                        });
                      } else {
                        favouriteproduct.remove(products[index]);
                        setState(() {
                          products[index]['isfavourite'] = false;
                        });
                      }
                    },
                    child: Icon(
                      Icons.favorite,
                      color: products[index]['isfavourite'] == true
                          ? Colors.red
                          : Colors.black,
                    ))
              ],
            ),
          );
        }),
      ),
      bottomNavigationBar: Row(
        children: [
          Container(
            width: 200,
            child: ElevatedButton(
              onPressed: () {
                List<Map> tempP = [];
                products.forEach((element) {
                  if (element['isfavourite']) {
                    return tempP.add(element);
                  }
                });
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            FavouriteView(favproduct: tempP)));
              },
              child: Text("View Favourite"),
            ),
          ),
          Container(
            width: 200,
            child: ElevatedButton(
              onPressed: () {},
              child: Text("View Cart"),
            ),
          ),
        ],
      ),
    );
  }
}

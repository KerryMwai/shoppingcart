import 'package:flutter/material.dart';
import 'package:flutter_badged/flutter_badge.dart';
import 'package:provider/provider.dart';
import 'package:shoppingcart/constants/constants.dart';
import 'package:shoppingcart/controller/changeNotifier.dart';
import 'package:shoppingcart/pages/itemslist.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ShoppingCartChangeNotifier cart =
        Provider.of<ShoppingCartChangeNotifier>(context);
    int couter = cart.cartItem.length;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Shopping Cart"),
          centerTitle: true,
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 15, bottom: 12, top: 10),
              child: IconButton(
                icon: FlutterBadge(
                  contentPadding: const EdgeInsets.all(4),
                  icon: const Icon(Icons.shopping_cart),
                  itemCount: couter,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CartItemsPage()));
                },
              ),
            )
          ],
        ),
        body: GridView.builder(
            itemCount: shoppingcart.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 1, mainAxisSpacing: 1),
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(10),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    color: shoppingcart[index]['color'],
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      shoppingcart[index]['product_name'],
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Ksh. ${shoppingcart[index]['price']}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.limeAccent),
                          onPressed: () {
                            cart.addItemToCart(SelectedItem(
                                name: shoppingcart[index]['product_name'],
                                price: shoppingcart[index]['price']));
                          },
                          child: const Text(
                            "Add",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            }));
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingcart/controller/changeNotifier.dart';

class CartItemsPage extends StatelessWidget {
  const CartItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    ShoppingCartChangeNotifier cart =
        Provider.of<ShoppingCartChangeNotifier>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Items"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
              cart.cartItem.length,
              (index) => Card(
                    color: Colors.black.withOpacity(0.5),
                    margin:
                        const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            cart.cartItem[index].name,
                            style: const TextStyle(
                                fontSize: 15,
                                letterSpacing: 1.5,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "${cart.cartItem[index].price}",
                            style: const TextStyle(
                                fontSize: 15,
                                letterSpacing: 1.5,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                  )),
        ),
      ),
      bottomNavigationBar: Container(
        width: size.width,
        height: 70,
        decoration: BoxDecoration(
            color: Colors.orange[700],
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                "Payout: Ksh. ${cart.totalPrice}",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.payments_rounded,
                      color: Colors.white,
                      size: 30,
                    )),
                const Text(
                  "Pay",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

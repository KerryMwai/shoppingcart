import 'package:flutter/material.dart';

class ShoppingCartChangeNotifier extends ChangeNotifier {
  int _totalPrice = 0;
  List<SelectedItem> cartItem = [];
  List<SelectedItem> itemsWithoutRepet = [];
  int get totalPrice => _totalPrice;
  priceControl(int price) {
    _totalPrice += price;
    notifyListeners();
  }

  addItemToCart(SelectedItem item) {
    cartItem.add(item);
    priceControl(item.price);
    notifyListeners();
  }

  itemsWithoutRepetition() {}
}

class SelectedItem {
  String name;
  int price;
  SelectedItem({required this.name, required this.price});
}

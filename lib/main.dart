import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingcart/controller/changeNotifier.dart';
import 'package:shoppingcart/pages/home.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ShoppingCartChangeNotifier())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping Cart',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: HomePage(),
    );
  }
}

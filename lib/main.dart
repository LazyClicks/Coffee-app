import 'package:flutter/material.dart';
import 'package:flutter_application_2/datamanager.dart';
import 'package:flutter_application_2/pages/offerspage.dart';

import 'pages/menupage.dart';
import 'pages/orderpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Masters',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.brown,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.brown),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DataManager dataManager = DataManager();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget selectedPage = const Text("data");
    switch (selectedIndex) {
      case 0:
        selectedPage = MenuPage(
          dataManager: dataManager,
        );
        break;
      case 1:
        selectedPage = const OffersPage();
        break;
      case 2:
        selectedPage = OrderPage(
          dataManager: dataManager,
        );
        break;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Center(
          child: Image.asset(
            "images/logo.png",
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (newIndex) {
            setState(() {
              selectedIndex = newIndex;
            });
          },
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Colors.brown.shade50,
          unselectedItemColor: Colors.brown.shade200,
          items: const [
            BottomNavigationBarItem(
              label: "Menu",
              icon: Icon(Icons.coffee),
            ),
            BottomNavigationBarItem(
                label: "Offers",
                icon: Icon(
                  Icons.local_offer,
                )),
            BottomNavigationBarItem(
                label: "Orders",
                icon: Icon(
                  Icons.shopping_cart_checkout_outlined,
                )),
          ]),
      body: selectedPage,
    );
  }
}

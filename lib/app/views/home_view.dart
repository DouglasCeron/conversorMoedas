import 'package:conversor_app/app/componentes/converter_button.dart';
import 'package:conversor_app/app/controllers/home_controller.dart';

import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  HomeView() {}

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController homeController;
  final TextEditingController toText = TextEditingController();

  final TextEditingController fromText = TextEditingController();

  @override
  void initState() {
    homeController = HomeController(toText: toText, fromText: fromText);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(45.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/images/logo.png',
              scale: 3,
              color: Colors.white,
            ),
            Column(
              children: [
                ConverterButton(
                  selectedItem: homeController.toCurrency,
                  controller: toText,
                  items: homeController.currencies,
                  onChanged: (value) {
                    setState(() {
                      homeController.toCurrency = value;
                    });
                  },
                ),
                ConverterButton(
                  selectedItem: homeController.fromCurrency,
                  controller: fromText,
                  items: homeController.currencies,
                  onChanged: (value) {
                    setState(() {
                      homeController.fromCurrency = value;
                    });
                  },
                ),
              ],
            ),
            RaisedButton(
              color: Colors.amber,
              child: Text('CONVERTER'),
              onPressed: () {
                homeController.convert();
              },
            )
          ],
        ),
      ),
    );
  }
}

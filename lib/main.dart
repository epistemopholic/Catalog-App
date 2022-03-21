import 'package:catalog_app/pages/cart.dart';
import 'package:catalog_app/routes.dart';
import 'package:catalog_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:catalog_app/homepage.dart';
import 'package:velocity_x/velocity_x.dart';
import 'store.dart';

void main() => runApp(
      VxState(
        store: MyStore(),
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: MyNewTheme.lightTheme(context),
      darkTheme: MyNewTheme.darkTheme(context),
      home: const Homepage(),
      routes: {
        MyRoutes.cartPage: (context) => const CartPage(),
      },
    );
  }
}

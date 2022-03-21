import 'package:catalog_app/routes.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:catalog_app/model.dart';
//import 'package:catalog_app/pages/header.dart';
import 'package:catalog_app/pages/product_list.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 1));
    final catalogJson = await rootBundle.loadString("assets/data.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    //products = ProductsList.fromMap(productsData).products;
    CatalogModel.products = List.from(productsData)
        .map<Product>((products) => Product.fromMap(products))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      //backgroundColor: context.cardColor,
      appBar: AppBar(
        centerTitle: true,
        title: "Catalog Shop".text.color(Colors.black).wider.make(),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        onPressed: () {
          Navigator.pushNamed(context, MyRoutes.cartPage);
        },
        child: const Icon(Icons.shopping_bag),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //const CatalogHeader(),
              if (CatalogModel.products.isNotEmpty)
                const CatalogList().expand()
              else
                const CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}

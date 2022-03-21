import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:catalog_app/model.dart';

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
    await Future.delayed(const Duration(seconds: 3));
    final catalogJson = await rootBundle.loadString("assets/data.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.products = List.from(productsData)
        .map<Product>((products) => Product.fromMap(products))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: (CatalogModel.products.isNotEmpty)
            ? ListView.builder(
                itemCount: CatalogModel.products.length,
                itemBuilder: (context, index) {
                  return ItemWidget(
                    // we can also do like this
                    //final myProducts = CatalogModel.products[index];
                    //products: myProducts,
                    products: CatalogModel.products[index],
                  );
                },
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  final Product products;
  // ignore: use_key_in_widget_constructors
  const ItemWidget({required this.products});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        child: ListTile(
          onTap: () {},
          leading: Image.network(products.image),
          title: Text(products.name),
          subtitle: Text(products.desc),
          trailing: Text(
            "\$${products.price}",
            textScaleFactor: 1.5,
            style: const TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:catalog_app/model.dart';

class HomepageGrid extends StatefulWidget {
  const HomepageGrid({Key? key}) : super(key: key);

  @override
  _HomepageGridState createState() => _HomepageGridState();
}

class _HomepageGridState extends State<HomepageGrid> {
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
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: 1.3,
            //mainAxisExtent: 200,
          ),
          itemCount: CatalogModel.products.length,
          itemBuilder: (context, index) {
            final myProducts = CatalogModel.products[index];
            return Card(
              clipBehavior: Clip.antiAlias,
              shadowColor: Colors.grey.shade100,
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: GridTile(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Image.network(myProducts.image),
                ),
                header: Container(
                  padding: const EdgeInsets.all(8),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    myProducts.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.blue),
                  ),
                ),
                footer: Container(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "\$${myProducts.price.toString()}",
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.lightGreen),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

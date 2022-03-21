import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:catalog_app/model.dart';
import 'package:catalog_app/pages/product_image.dart';
import 'package:catalog_app/pages/products_details.dart';
import 'package:catalog_app/add_cart.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.products.length,
      itemBuilder: (context, index) {
        // final myProducts = CatalogModel.getByPostion(index);
        final myProducts = CatalogModel.products[index];
        return InkWell(
            onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ProductDetails(products: myProducts);
                    },
                  ),
                ),
            child: ProductsList(products: myProducts));
      },
    );
  }
}

class ProductsList extends StatelessWidget {
  final Product products;
  const ProductsList({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
              tag: key ?? (products.id.toString()),
              child: ProductImage(image: products.image)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                products.name.text.bold.make().py4(),
                products.desc.text.make(),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "\$${products.price}".text.green800.bold.make(),
                    AddToCart(catalog: products),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ).color(Colors.white).rounded.square(140).make().py16();
  }

  static fromMap(String catalogJson) {}
}

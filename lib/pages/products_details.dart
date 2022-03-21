import 'package:catalog_app/model.dart';
import 'package:catalog_app/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductDetails extends StatelessWidget {
  final Product products;
  const ProductDetails({Key? key, required this.products}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          centerTitle: true,
          title: "Catalog Shop".text.color(Colors.black).wider.make(),
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.amber.shade300,
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            children: [
              "\$${products.price}".text.size(22).green800.bold.make(),
              ElevatedButton(
                style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(const Size(100, 30)),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.deepOrange),
                    shape: MaterialStateProperty.all(const StadiumBorder())),
                onPressed: () {
                  Navigator.pushNamed(context, MyRoutes.cartPage);
                },
                child: "Buy".text.make(),
              ),
            ],
          ).pSymmetric(h: 10),
        ),
        body: Column(
          children: [
            Hero(
              tag: key ?? (products.id.toString()),
              child: Image.network(products.image),
            ).h32(context).wFull(context),
            Expanded(
              child: VxArc(
                height: 20.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  color: Colors.amber,
                  child: Column(
                    children: [
                      products.name.text.bold.size(22).make(),
                      products.desc.text.italic.size(10).make(),
                      10.heightBox,
                      "iPhone 12 Pro is based on iOS 14 and packs 64GB of inbuilt storage. The iPhone 12 Pro is a dual-SIM (GSM and GSM) mobile that accepts Nano-SIM and eSIM cards."
                          .text
                          .center
                          .make(),
                      // BottomAppBar(
                      //   color: Colors.transparent,
                      //   elevation: 0,
                      //   child: ButtonBar(
                      //     alignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       "\$${products.price}".text.green800.bold.make(),
                      //       ElevatedButton(
                      //         style: ButtonStyle(
                      //             backgroundColor: MaterialStateProperty.all(
                      //                 Colors.deepOrange),
                      //             shape: MaterialStateProperty.all(
                      //                 const StadiumBorder())),
                      //         onPressed: () {},
                      //         child: "Buy".text.make(),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ).pSymmetric(h: 10, v: 50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

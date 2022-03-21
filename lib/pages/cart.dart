// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:catalog_app/cart_model.dart';
import 'package:catalog_app/store.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: "Cart".text.color(Colors.black).wider.make(),
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Column(
        children: [
          CartList().p20().expand(),
          Divider(),
          CartTotal().px20(),
        ],
      ),
    );
  }
}

class CartList extends StatelessWidget {
  CartList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? "Nothing to show".text.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: const Icon(
                Icons.done,
              ),
              title: _cart.items[index].name.text.make(),
              trailing: IconButton(
                onPressed: () => RemoveMutation(_cart.items[index]),
                icon: const Icon(Icons.remove),
              ),
            ),
          );
  }
}

class CartTotal extends StatelessWidget {
  CartTotal({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          VxBuilder(
            mutations: {RemoveMutation},
            builder: (context, _, __) {
              return "\$${_cart.totalPrice}".text.size(18).green800.bold.make();
            },
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
              shape: MaterialStateProperty.all(const StadiumBorder()),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: "Processing".text.make(),
                ),
              );
            },
            child: "Buy Now".text.make(),
          ),
        ],
      ),
    );
  }
}

import 'package:velocity_x/velocity_x.dart';

import 'package:catalog_app/model.dart';

import 'cart_model.dart';

class MyStore extends VxStore {
  late CatalogModel catalog;
  late CartModel cart;

  MyStore() {
    catalog = CatalogModel();
    cart = CartModel();
    cart.catalog = catalog;
  }
}

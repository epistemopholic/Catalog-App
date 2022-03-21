import 'package:catalog_app/model.dart';
import 'package:velocity_x/velocity_x.dart';
import 'store.dart';

class CartModel {
  late CatalogModel _catalog;
  final List<int> _productsid = [];

  CatalogModel get catalog => _catalog;
  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  List<Product> get items =>
      _productsid.map((id) => CatalogModel.getById(id)).toList();

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // Remove Item

  void remove(Product products) {
    _productsid.remove(products.id);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Product products;

  AddMutation(this.products);
  @override
  perform() {
    store!.cart._productsid.add(products.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Product item;
  RemoveMutation(this.item);
  @override
  perform() {
    store!.cart._productsid.remove(item.id);
  }
}

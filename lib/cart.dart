import 'package:flutter_exp/core/store.dart';
import 'package:flutter_exp/models/products.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  late items _catalog; // Private field for the catalog of items

  final List<int> itemids = []; // List of item IDs in the cart

  // Getter for the private _catalog field
  // ignore: unnecessary_getters_setters
  items get catalog => _catalog;

  // Setter for the private _catalog field
  set catalog(items newcatalog) {
    _catalog = newcatalog;
  }

  // Getting the list of items in the cart by mapping item IDs to Products
  List<Product> get itemc => itemids.map((id) => _catalog.getById(id)).toList();

  // Calculating the total price of items in the cart
  num get totalPrice {
    return itemc.fold(0, (total, current) => total + (current.price));
  }

  // Method to add a product to the cart
  void add(Product item) {
    itemids.add(item.id);
  }

  // Method to remove a product from the cart
  void remove(Product item) {
    itemids.remove(item.id);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Product item;

  AddMutation(this.item);
  @override
  perform() {
    store?.cart.itemids.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Product item;

  RemoveMutation(this.item);
  @override
  perform() {
    store?.cart.itemids.remove(item.id);
  }
}



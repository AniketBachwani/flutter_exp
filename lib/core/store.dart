import 'package:flutter_exp/cart.dart';
import 'package:flutter_exp/models/products.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  late  items catalog;
  late CartModel cart;

MyStore(){
    catalog = items();
    cart = CartModel();
    cart.catalog = catalog;
}

}

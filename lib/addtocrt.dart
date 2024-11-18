// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exp/cart.dart';
import 'package:flutter_exp/core/store.dart';
// import 'package:flutter_exp/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

import 'models/products.dart';

class AddtoCart extends StatelessWidget {
  final Product catalogab;

  const AddtoCart(this.catalogab, {super.key});

  @override
  Widget build(BuildContext context) {
    return VxBuilder(
        mutations: const {AddMutation,RemoveMutation},
        builder: (context, store, _) {
          final CartModel cart = (VxState.store as MyStore).cart;
          bool incart = cart.itemc.contains(catalogab);
          return ElevatedButton(
            onPressed: () {
              if (!incart) {
                AddMutation(catalogab);
              }
              //  if (!incart) {
              //   cart.add(widget.catalogab);}
              else {
                RemoveMutation(catalogab);
              }
            },
            style: ButtonStyle(
              shape: WidgetStateProperty.all(const StadiumBorder()),
            ),
            child: incart
                ? const Icon(CupertinoIcons.cart_fill_badge_minus)
                : const Icon(CupertinoIcons.cart_badge_plus),
          );
        }
        );
  }
}

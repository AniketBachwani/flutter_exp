import 'package:flutter/material.dart';
import 'package:flutter_exp/cart.dart';
import 'package:flutter_exp/core/store.dart';
// import 'package:flutter_exp/models/products.dart';
// import 'package:flutter_exp/models/products.dart';
import "package:velocity_x/velocity_x.dart";

class Floatingpage extends StatelessWidget {
  const Floatingpage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: "Cart".text.bold.xl4.make().centered(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          const Divider(),
          const CartTotal(),
        ],
      ),
    );
  }
}

class CartTotal extends StatelessWidget {
  const CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    return VxBuilder(
        mutations: const {AddMutation, RemoveMutation},
        builder: (context, store, _) {
          final CartModel cart = (VxState.store as MyStore).cart;
          return SizedBox(
            height: 200,
            child: (Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                "\$${cart.totalPrice}".text.xl4.color(Colors.black).make(),
                const WidthBox(30),
                ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: "Buying Not Supported Yet".text.make()));
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.blue.shade400)),
                        child: "Buy".text.xl3.color(Colors.white).make())
                    .w24(context)
              ],
            )),
          );
        });
  }
}

// ignore: unused_element
class _CartList extends StatelessWidget {
  final CartModel _cart = (VxState.store as MyStore).cart;
  @override
  Widget build(BuildContext context) {
    return VxBuilder(
        mutations: const {RemoveMutation},
        builder: (context, store, _) {
          return _cart.itemc.isEmpty
              ? "Cart is Empty I guess".text.xl3.makeCentered()
              : ListView.builder(
                  itemCount: _cart.itemc.length,
                  itemBuilder: (context, index) => ListTile(
                        leading: const Icon(Icons.done),
                        trailing: IconButton(
                            icon: const Icon(Icons.remove_circle_outline),
                            onPressed: () {
                              RemoveMutation(_cart.itemc[index]);
                              // setState(() {});
                            }),
                        title: _cart.itemc[index].name.text.make(),
                      ));
        });
  }
}

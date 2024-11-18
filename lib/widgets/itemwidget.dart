// ignore_for_file: camel_case_types, non_constant_identifier_names
import "package:flutter_exp/models/products.dart";
import "package:flutter/material.dart";

class item_widget extends StatelessWidget {
  final Product product;

  // ignore: use_super_parameters
  const item_widget({Key? key, required this.product}) :  super(key : key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(product.image),
        title: Text(product.name),
        subtitle: Text(product.desc),
        // ignore: deprecated_member_use
        trailing: Text("\$ ${product.price.toString()}",textScaleFactor: 1.5,style:const TextStyle(color:Colors.red,fontWeight: FontWeight.bold)),
      ),
    );
  }
}
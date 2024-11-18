// ignore_for_file: library_private_types_in_public_api, avoid_print

import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_exp/cart.dart";
import "package:flutter_exp/core/store.dart";
// import "package:flutter_exp/themes.dart";
import "dart:convert";
import 'package:flutter_exp/utils/routes.dart';
import "package:flutter/services.dart";
import "package:flutter_exp/widgets/drawer.dart";
import "package:flutter_exp/widgets/home_pagewidgets/catalog_header.dart";
import "package:flutter_exp/widgets/home_pagewidgets/cataloglist.dart";
import "package:velocity_x/velocity_x.dart";
import "package:flutter_exp/models/products.dart";
// import "package:http/http.dart" as http;

// import "package:flutter/widgets.dart";

// ignore: camel_case_types
class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<homepage> {
  // final url = "https://api.jsonbin.i0/b/604dbddb683e7e079c4eefd3";
  @override
  void initState() {
    super.initState();
    loadata();
  }

  loadata() async {
    try {
      final prodJson = await rootBundle.loadString("assets/data/data.json");
      // final prodJson = await http.get(url);
      final decodedJson = jsonDecode(prodJson);
      var prodData = decodedJson["products"];
      print("Raw JSON data: $prodData");
      items.item = List.from(prodData)
          .map<Product>((products) => Product.fromMap(products))
          .toList();
      // for (var product in items.item) {
      //   print('Product name: ${product.name}');
      // }

      print("Products parsed successfully.");
      setState(() {});
    } catch (e) {
      print("Error loading or parsing JSON: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
        // backgroundColor :MyThemes.lightone,
        appBar: AppBar(),
        drawer: const mydrawer(),
        floatingActionButton: VxBuilder(
            mutations: const {AddMutation, RemoveMutation},
            builder: (context, store, _) {
              return FloatingActionButton(
                      onPressed: () {
                        Navigator.pushNamed(context, myroutes.floatingpagerote);
                      },
                      child: const Icon(CupertinoIcons.cart))
                  .badge(
                      color: Vx.blue100,
                      size: 20,
                      count: _cart.itemc.length,
                      textStyle: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold));
            }),
        body: SafeArea(
          child: Container(
              // color: MyThemes.lightfour,
              padding: Vx.m32,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CatalogHeader(),
                  const SizedBox(
                    height: 16,
                  ),
                  Expanded(child: CatalogList()),
                ],
              )),
        ));
  }
}

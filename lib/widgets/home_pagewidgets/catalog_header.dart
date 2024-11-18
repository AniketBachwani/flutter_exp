import 'package:flutter/material.dart';
// import 'package:flutter_exp/themes.dart';
// import 'package:flutter_exp/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // backgroundColor(Colors.amber),
        "Catalog App".text.xl5.bold.color(Colors.black).make(),
        "Trending products".text.xl2.color(Colors.black).make()
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_exp/Addtocrt.dart';
import 'package:flutter_exp/models/products.dart';
// import 'package:flutter_exp/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetail extends StatelessWidget {
  final Product catalog;
  const HomeDetail({
    super.key,
    required this.catalog,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue[700]),
      bottomNavigationBar: Container(
        child: ButtonBar(alignment: MainAxisAlignment.spaceBetween, children: [
          "\$${catalog.price}".text.xl.bold.color(Colors.red).make(),
          AddtoCart(catalog).wh(100, 40).pOnly(right: 8.0)
        ]).px32(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.asset(catalog.image))
                .h48(context),
            Expanded(
                child: VxArc(
              height: 12,
              arcType: VxArcType.convey,
              edge: VxEdge.top,
              child: Container(
                color: Colors.blue,
                width: context.screenWidth,
                child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      catalog.name.text.bold.xl5.make(),
                      catalog.desc.text.xl
                          .textStyle(context.captionStyle)
                          .make(),
                      const HeightBox(10),
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit."
                          .text
                          .textStyle(context.captionStyle)
                          .make()
                          .p16(),
                    ],
                  ).py32(),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}

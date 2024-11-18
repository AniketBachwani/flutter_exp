// ignore: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:flutter_exp/Addtocrt.dart';
// import 'package:flutter_exp/cart.dart';
import 'package:flutter_exp/models/products.dart';
// import 'package:flutter_exp/themes.dart';
import 'package:flutter_exp/widgets/home_detail.dart';
import 'package:flutter_exp/widgets/home_pagewidgets/catalogimage.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: use_key_in_widget_constructors
class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return ListView.builder(
      shrinkWrap: true,
      itemCount: items.item.length, // Ensure items.item is a List<Product>
      itemBuilder: (context, index) {
        final catalog = items.item[index]; // This should be Product
        return SizedBox(
          height: height * 0.25,
          child: InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeDetail(catalog: catalog))),
            child: CatalogItem(
              catalog: catalog,
            ),
          ),
        );
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Product _catalog;

  const CatalogItem({super.key, required Product catalog}) : _catalog = catalog;
  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
          tag: Key(_catalog.id.toString()),
          child: CatalogImage(
            image: _catalog.image,
          ),
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _catalog.name.text.bold.xl.make(),
            _catalog.desc.text.textStyle(context.captionStyle).make(),
            10.heightBox,
            ButtonBar(alignment: MainAxisAlignment.spaceBetween, children: [
              "\$${_catalog.price}".text.xl.bold.color(Colors.red).make(),
              AddtoCart(
                _catalog,
              ),
            ]).pOnly(right: 8.0)
          ],
        ))
      ],
    )).roundedLg.blue100.square(100).make().py16();
  }
}

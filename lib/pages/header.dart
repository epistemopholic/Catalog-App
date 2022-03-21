import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog Store".text.xl3.bold.color(const Color(0xff283593)).make(),
        const SizedBox(height: 4),
        "Trending Products".text.xl.italic.color(Colors.blueGrey).make(),
      ],
    );
  }
}

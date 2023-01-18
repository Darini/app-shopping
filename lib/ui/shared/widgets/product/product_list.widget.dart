import 'package:shopping/models/product_list_item.model.dart';
import 'package:shopping/ui/shared/widgets/shared/loader.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'product_card.widget.dart';

class ProductList extends StatelessWidget {
  final List<ProductItemListModel>? products;

  const ProductList({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 410,
      child: Loader(
        object: products,
        callback: list,
      ),
    );
  }

  Widget list() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: products?.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(5),
          child: ProductCard(
            item: products![index],
          ),
        );
      },
    );
  }
}

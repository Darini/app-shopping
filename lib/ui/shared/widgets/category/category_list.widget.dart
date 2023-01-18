import 'package:shopping/models/category.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping/ui/shared/widgets/shared/loader.widget.dart';
import 'category_card.widget.dart';

class CategoryList extends StatelessWidget {
  final List<CategoryModel>? categories;

  const CategoryList({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Loader(
        object: categories,
        callback: list,
      ),
    );
  }

  Widget list() {
    return ListView.builder(
      itemCount: categories?.length,
      itemBuilder: (context, index) {
        CategoryModel item = categories![index];

        return Padding(
          padding: const EdgeInsets.all(5),
          child: CategoryCard(item: item),
        );
      },
      scrollDirection: Axis.horizontal,
    );
  }
}

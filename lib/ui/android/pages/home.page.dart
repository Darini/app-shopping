import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/blocs/home.bloc.dart';
import 'package:shopping/ui/shared/widgets/category/category_list.widget.dart';
import 'package:shopping/ui/shared/widgets/product/product_list.widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<HomeBloc>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 60,
            ),
            const Text(
              'Categorias',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            CategoryList(
              categories: bloc.categories,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Mais Vendidos',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ProductList(
              products: bloc.products,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:shopping/blocs/cart.bloc.dart';
import 'package:shopping/models/cart_item.model.dart';
import 'package:shopping/ui/shared/widgets/shared/loader.widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../../shared/widgets/cart/cart_item.widget.dart';

class CartPage extends StatelessWidget {
  final price = NumberFormat('#,##0.00', 'pt_BR');
  List<CartItemModel> itens = [];
  late CartBloc bloc;

  CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bloc = Provider.of<CartBloc>(context);

    itens = bloc.cart;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          top: 60,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Loader(
                object: bloc.cart,
                callback: list,
              ),
            ),
            Container(
              height: 80,
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'R\$ ${price.format(bloc.total)}',
                    style: const TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Checkout',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).primaryColor),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget list() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: itens.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: Key(itens[index].id!),
          child: CartItem(item: itens[index]),
          onDismissed: (direction) {
            bloc.remove(itens[index]);
          },
          background: Container(
            color: Colors.red.withOpacity(0.1),
          ),
        );
      },
    );
  }
}

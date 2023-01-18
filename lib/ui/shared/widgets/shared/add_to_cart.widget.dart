import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/blocs/cart.bloc.dart';
import 'package:shopping/models/cart_item.model.dart';
import 'package:shopping/models/product_list_item.model.dart';

class AddToCart extends StatelessWidget {
  final ProductItemListModel item;

  const AddToCart({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CartBloc?>(context);
    bool itemInCart = false;

    CartItemModel cartItem = CartItemModel(
      id: item.id,
      image: item.image,
      price: item.price,
      quantity: 1,
      title: item.title,
    );

    itemInCart = bloc?.itemInCart(cartItem);

    return SizedBox(
      width: 80,
      height: 40,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: !itemInCart
              ? MaterialStateProperty.all(Theme.of(context).primaryColor)
              : MaterialStateProperty.all(Colors.red),
          foregroundColor: MaterialStateProperty.all(Colors.white),
        ),
        child: Icon(
          !itemInCart ? Icons.add_shopping_cart : Icons.remove_shopping_cart,
        ),
        onPressed: () {
          if (!itemInCart) {
            bloc?.add(cartItem);
            final snackBar = SnackBar(
              content: Text('${item.title} adicionado'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else {
            bloc?.remove(cartItem);
            final snackBar = SnackBar(
              content: Text('${item.title} removido'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
      ),
    );
  }
}

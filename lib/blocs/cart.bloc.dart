import 'package:shopping/models/cart_item.model.dart';
import 'package:flutter/widgets.dart';

class CartBloc extends ChangeNotifier {
  List<CartItemModel> cart = [];
  double total = 0;

  get() {
    return cart;
  }

  add(CartItemModel item) {
    cart.add(item);
    calculateTotal();
  }

  remove(CartItemModel item) {
    cart.removeWhere((element) => element.id == item.id);
    calculateTotal();
  }

  itemInCart(CartItemModel item) {
    var result = false;

    for (var element in cart) {
      if (element.id == item.id) {
        result = true;
        break;
      }
    }

    return result;
  }

  increase(CartItemModel item) {
    if (item.quantity! < 10) {
      item.quantity = item.quantity! + 1;
      calculateTotal();
    }
  }

  decrease(CartItemModel item) {
    if (item.quantity! > 1) {
      item.quantity = item.quantity! - 1;
      calculateTotal();
    }
  }

  calculateTotal() {
    total = 0;

    for (var element in cart) {
      total += (element.price! * element.quantity!);
    }

    notifyListeners();
  }
}

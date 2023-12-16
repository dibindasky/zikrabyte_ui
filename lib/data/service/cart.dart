import 'package:zikrabyte_ui/data/model/cart_model.dart';
import 'package:zikrabyte_ui/data/model/item_model.dart';
import 'package:flutter/material.dart';

ValueNotifier<List<CartItemModel>> cartNotifier = ValueNotifier([]);
ValueNotifier<int> totalNotifier = ValueNotifier(0);

class CartDB with ChangeNotifier { 
  static void addToCart({required Item item}) {
    for (var x in cartNotifier.value) {
      if (x.item == item) {
        x.quantity += 1;
        totalNotifier.value += item.price;
        totalNotifier.notifyListeners();
        cartNotifier.notifyListeners();
        return;
      }
    }
    cartNotifier.value.add(CartItemModel(item: item, quantity: 1));

    totalNotifier.value += item.price;
    totalNotifier.notifyListeners();
    cartNotifier.notifyListeners();
  }

  static void addQuantity({required CartItemModel item}) {
    final index = cartNotifier.value.indexWhere((element) => element == item);
    cartNotifier.value[index] = item..quantity += 1;
    totalNotifier.value += item.item.price;
    totalNotifier.notifyListeners();
    cartNotifier.notifyListeners();
  }

  static void decQuantity({required CartItemModel item}) {
    final index = cartNotifier.value.indexWhere((element) => element == item);
    if (item.quantity == 1) {
      cartNotifier.value.removeAt(index);
    } else {
      cartNotifier.value[index] = item..quantity -= 1;
    }
    totalNotifier.value -= item.item.price;
    totalNotifier.notifyListeners();
    cartNotifier.notifyListeners();
  }

  static void clearCart() {
    cartNotifier.value.clear();
    totalNotifier.value = 0;
    totalNotifier.notifyListeners();
    cartNotifier.notifyListeners();
  }
}

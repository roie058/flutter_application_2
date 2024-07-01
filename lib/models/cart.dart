import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/shoe.dart';

class Cart extends ChangeNotifier {
  List<Shoe> shoeShop = [
    Shoe(
        name: 'Zoom FREAK',
        price: '236',
        description: 'Signature shoe',
        imagePath: 'lib/images/ZoomFreak.png'),
    Shoe(
        name: 'Air Jordan',
        price: '220',
        description: 'Cool shoe',
        imagePath: 'lib/images/AirJordan.png'),
    Shoe(
        name: 'KD TREYS',
        price: '240',
        description: 'Performance',
        imagePath: 'lib/images/ZoomFreak.png'),
    Shoe(
        name: 'Kyrie 6',
        price: '190',
        description: 'Good for running',
        imagePath: 'lib/images/AirJordan.png'),
  ];
  List<Shoe> userCart = [];

  List<Shoe> getShoeList() {
    return shoeShop;
  }

  List<Shoe> getUserCart() {
    return userCart;
  }

  void addToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  void removeFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}

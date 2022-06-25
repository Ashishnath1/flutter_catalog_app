import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/cart.dart';
import '../../models/catalog.dart';

class AddToCart extends StatefulWidget {
  final Item catalog;
  const AddToCart({Key? key, required this.catalog}) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final cart = CartModel();

  @override
  Widget build(BuildContext context) {
    bool isInCart = cart.items.contains(widget.catalog);
    return  ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColorDark),
          shape: MaterialStateProperty.all(const StadiumBorder()),
        ),
        onPressed: (){
          //so that items are not added twice
          if(!isInCart){
            isInCart = !isInCart;
            final catalog = CatalogModel();
            cart.catalog = catalog;
            cart.add(widget.catalog);
            setState((){});
          }
        },
        child: isInCart ? const Icon(Icons.done) : const Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}

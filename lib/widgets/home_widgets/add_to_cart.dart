import 'package:catalog_app/core/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/cart.dart';
import '../../models/catalog.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({Key? key, required this.catalog}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation]);
    final CartModel cart = (VxState.store as MyStore).cart;
    bool isInCart = cart.items.contains(catalog);
    return  ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColorDark),
          shape: MaterialStateProperty.all(const StadiumBorder()),
        ),
        onPressed: (){
          //so that items are not added twice
          if(!isInCart){
            AddMutation(catalog);
            // setState((){});
          }
        },
        child: isInCart ? const Icon(Icons.done) : const Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}

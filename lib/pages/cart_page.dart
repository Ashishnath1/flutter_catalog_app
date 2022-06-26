
import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
       appBar: AppBar(
         backgroundColor: Colors.transparent,
         title:  Text("Cart" , style: TextStyle(
           color: Theme.of(context).primaryColor
         ),),
       ),
      body: Column(
        children:  [
          Expanded(
              child:  Padding(
                padding: const EdgeInsets.all(32),
                  child: _CartList())),
          const Divider(),
          _CartTotal()

        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartModel cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Text("\$${cart.totalPrice}", style: const TextStyle(
              color: Colors.red,
              fontSize: 40
            ),),
            SizedBox(
              width: 150,
              height: 50,
              child: ElevatedButton(
                  onPressed: (){
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Buying not supported yet")));
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColorDark),

                  ),
                  child: const Text("Buy",style: TextStyle(
                    color: Colors.white,
                    fontSize: 24
                  ),)
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _CartList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty?
    const Center(child: Text("Nothing to show", style: TextStyle(fontSize: 24),),) : ListView.builder(
        itemCount: _cart.items.length,
        itemBuilder: (context, index) => ListTile(
          leading: const Icon(Icons.done),
          trailing: IconButton(
            icon: const Icon(Icons.remove_circle_outline),
            onPressed: (){
              _cart.remove(_cart.items[index]);
              // setState((){});
            },
          ),
          title: Text(_cart.items[index].name),
        )
    );
  }
}




import 'package:flutter/material.dart';

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
        children:  const [
          Expanded(
              child:  Padding(
                padding: EdgeInsets.all(32),
                  child: _CartList())),
          Divider(),
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
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text("\$${999}", style: TextStyle(
            color: Colors.red,
            fontSize: 40
          ),),
          SizedBox(
            width: 150,
            height: 50,
            child: ElevatedButton(
                onPressed: (){},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColorDark),

                ),
                child: Text("Buy",style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 24
                ),)
            ),
          )
        ],
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  const _CartList({Key? key}) : super(key: key);

  @override
  State<_CartList> createState() => _CartListState();
}

class _CartListState extends State<_CartList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => ListTile(
          leading: const Icon(Icons.done),
          trailing: IconButton(
            icon: const Icon(Icons.remove_circle_outline),
            onPressed: (){},
          ),
          title: Text("iPhone"),
        )
    );
  }
}



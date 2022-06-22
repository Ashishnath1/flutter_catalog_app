import 'package:catalog_app/models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Theme.of(context).canvasColor,
      bottomNavigationBar: Container(
        color: Theme.of(context).cardColor,
        child: Padding(
          padding: const EdgeInsets.all(32),
          child :ButtonBar(
          buttonPadding: const EdgeInsets.symmetric(horizontal: 10),
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("\$${catalog.price}",style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
                color: Colors.red
            ),),
            SizedBox(
              height: 50,
              width: 150,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColorDark),
                    shape: MaterialStateProperty.all(const StadiumBorder()),
                  ),
                  onPressed: (){},
                  child: const Text("Buy", style:
                  TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),)
              ),
            )
          ],
        ),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .32,
              child: Hero(
                  tag: Key(catalog.id.toString()),
                  child: Image.network(catalog.image)
              ),
            ),
             Expanded(
                child: VxArc(
                  height: 30,
                  arcType: VxArcType.CONVEY,
                  edge: VxEdge.TOP,
                  child: Container(
                    color: Theme.of(context).cardColor,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Text(catalog.name, textScaleFactor: 2,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor
                        ),),
                        Text(catalog.desc, textScaleFactor: 1.5),
                        const SizedBox(height: 30),
                        const Padding(
                          padding: EdgeInsets.all(20),
                          child: Text("But I must explain to you how all this mistaken idea of "
                              "denouncing pleasure and praising pain was born and I will give you"
                              " a complete account of the system, and expound the actual teachings"
                              " of the great explorer of the truth, the master-builder of human "
                              "happiness. No one rejects, dislikes, or avoids pleasure itself,"
                              " because it is pleasure, but because those who do not know how to"
                              " pursue pleasure rationally encounter consequences that are"
                              " extremely painful. Nor again is there anyone who loves or pursues"
                              " or desires to obtain pain of itself, because it is pain, but "
                             ,textAlign: TextAlign.justify,),
                        )
                      ],
                    ).py64(),
                  ),

            ))
          ],
        ),
      ),
    );
  }
}

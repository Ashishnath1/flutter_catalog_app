import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: MyTheme.creamColor,),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          buttonPadding: const EdgeInsets.symmetric(horizontal: 10),
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("\$${catalog.price}",style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
                color: Colors.red
            ),),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
                  shape: MaterialStateProperty.all(const StadiumBorder()),
                ),
                onPressed: (){},
                child: const Text("Buy", style:
                TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),)
            ).wh(100, 50)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(catalog.image)
            ).h32(context),
             Expanded(
                child: VxArc(
                  height: 30,
                  arcType: VxArcType.CONVEY,
                  edge: VxEdge.TOP,
                  child: Container(
                    color: Colors.white,
                    width: context.screenWidth,
                    child: Column(
                      children: [
                        Text(catalog.name, textScaleFactor: 2,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: MyTheme.darkBluishColor
                        ),),
                        Text(catalog.desc, textScaleFactor: 1.5),
                        const SizedBox(height: 30),
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

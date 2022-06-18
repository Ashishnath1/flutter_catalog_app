import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/widgets/item_widget.dart';
import 'package:catalog_app/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:catalog_app/widgets/drawer.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState(){
    super.initState();
    loadData();
  }
  
  loadData() async {
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodeData = jsonDecode(catalogJson);
    var productsData = decodeData["products"];
    CatalogModel.items = List.from(productsData)
                          .map<Item>((item) => Item.fromMap(item))
                          .toList();
    setState((){});
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: MyTheme.creamColor,
     body: SafeArea(
     child: Container(
       padding: const EdgeInsets.all(32),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children:  [
           const CatalogHeader(),
           const SizedBox(height: 20),
           if(CatalogModel.items.isNotEmpty)
             const CatalogList().expand()
           else
             Center(child: const CircularProgressIndicator().centered().expand()
    )
         ],
       )
     ),
     ),
    );
  }
}
class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
          Text("Catalog App",
          textScaleFactor: 1.5,
          style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: MyTheme.darkBluishColor,
          ),),
            const Text("Trending products",
            textScaleFactor: 1.3,
            style:  TextStyle(
              fontSize: 20,
              color: Colors.black54
            ),)
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
       shrinkWrap: true,
       itemCount: CatalogModel.items.length,
        itemBuilder: (context, index){
          final catalog = CatalogModel.items[index];
          return CatalogItem(catalog: catalog);
        });
  }
}

class CatalogItem extends StatelessWidget {
  
  final Item catalog;
  const CatalogItem({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      height: 150,
      width: 100,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
         CatalogImage(image: catalog.image),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(catalog.name, style: TextStyle(
                fontWeight: FontWeight.bold,
                color: MyTheme.darkBluishColor
              ),),
              Text(catalog.desc, style: TextStyle(
                fontStyle: context.captionStyle?.fontStyle
              ),),
              const SizedBox(height: 10),
              ButtonBar(
                buttonPadding: const EdgeInsets.symmetric(horizontal: 10),
                alignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("\$${catalog.price}",style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
                        shape: MaterialStateProperty.all(const StadiumBorder()),
                      ),
                      onPressed: (){},
                      child: const Text("Buy", style:
                      TextStyle(
                        fontWeight: FontWeight.bold
                      ),))
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
        width: 200,
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: MyTheme.creamColor,
        ),
        child: Image.network(image)
    );
  }
}

import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/widgets/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:catalog_app/widgets/drawer.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

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
      appBar: AppBar(
        title: const Text("Catalog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty) ?
        ListView.builder(
            itemCount : CatalogModel.items.length,
            itemBuilder: (context, index){
          return  ItemWidget(
            item: CatalogModel.items[index],
          );
        }) : const Center(child: CircularProgressIndicator(),),
      ),
      drawer: const MyDrawer(),
    );
  }
}

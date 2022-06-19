import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:convert';
import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';


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
             const CircularProgressIndicator().centered().expand()
         ],
       )
     ),
     ),
    );
  }
}


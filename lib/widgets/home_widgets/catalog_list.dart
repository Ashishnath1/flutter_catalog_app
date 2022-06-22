import 'package:catalog_app/pages/home_detail_page.dart';
import 'package:flutter/material.dart';
import '../../models/catalog.dart';
import '../../widgets/theme.dart';
import 'catalog_image.dart';


class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index){
          final catalog = CatalogModel.getByPosition(index);
          return InkWell(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => HomeDetailPage(catalog: catalog))),
              child: CatalogItem(catalog: catalog)
          );
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
      height: 180,
      width: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Hero(
              tag: Key(catalog.id.toString()),
              child: CatalogImage(image: catalog.image)
          ),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(catalog.name, style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor
              ),),
              Text(catalog.desc),
              const SizedBox(height: 30),
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
                        backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColorDark),
                        shape: MaterialStateProperty.all(const StadiumBorder()),
                      ),
                      onPressed: (){},
                      child: const Text("Add to cart", style:
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
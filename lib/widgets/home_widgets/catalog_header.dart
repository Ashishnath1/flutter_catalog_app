
import 'package:flutter/material.dart';
import '../../widgets/theme.dart';

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
            color: Theme.of(context).primaryColor
          ),),
         Text("Trending products",
          textScaleFactor: 1.3,
          style:  TextStyle(
              fontSize: 20,
              color: Theme.of(context).primaryColor
          ),)
      ],
    );
  }
}
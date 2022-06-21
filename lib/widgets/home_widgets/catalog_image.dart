import 'package:flutter/material.dart';
import '../../widgets/theme.dart';

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
          color: Theme.of(context).canvasColor,
        ),
        child: Image.network(image)
    );
  }
}
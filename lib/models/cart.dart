import 'package:catalog_app/models/catalog.dart';


class CartModel{
  static final cartModel = CartModel._internal();
  CartModel._internal();
  factory CartModel() => cartModel;

  late CatalogModel _catalog;

  final List<int> _itemsId = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog){
    _catalog = newCatalog;
  }

  //get items in the cart
  List<Item> get items => _itemsId.map((id) => _catalog.getById(id)).toList();

  //get total price
  num get totalPrice => items.fold(0, (total, current) => total + current.price);

  //add item
  void add(Item item){
    _itemsId.add(item.id);
  }

  //remove item
  void remove(Item item){
    _itemsId.remove(item.id);
  }
}
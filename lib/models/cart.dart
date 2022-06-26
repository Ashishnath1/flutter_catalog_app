import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';


class CartModel{

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

class AddMutation extends VxMutation<MyStore>{
  final Item item;
  AddMutation(this.item);
  @override
  perform() {
   store?.cart._itemsId.add(item.id);
  }

}
import 'package:learnblocpattern/catalog/models/item.dart';

class Catalog {
  List<String> itemNames;

  Catalog(this.itemNames);

  Item getById(int id) => Item(id, itemNames[id]);

  Item getByPosition(int position) => getById(position);
}

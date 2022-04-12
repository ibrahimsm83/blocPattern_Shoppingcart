part of 'catalog_bloc.dart';

// Enum etc{
//   CatalogState;
//   CatalogEvent;
// }
//same enum type
abstract class CatalogState {}

//loading
class CatalogLoding extends CatalogState {}

//data loaded
class CatalogLoded extends CatalogState {
  Catalog catalog;
  CatalogLoded(this.catalog);
}

class CatalogError extends CatalogState {}
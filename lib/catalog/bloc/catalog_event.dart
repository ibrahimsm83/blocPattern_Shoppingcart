part of 'catalog_bloc.dart';

abstract class CatalogEvent {}

//when data is loaded the automatically call CatalogStarted no need to button press
class CatalogStarted extends CatalogEvent {}

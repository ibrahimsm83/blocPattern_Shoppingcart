import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnblocpattern/catalog/models/catalog.dart';
import 'package:learnblocpattern/repository/shoping_repository.dart';
part 'catalog_event.dart';
part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  CatalogBloc(this.shoppingRepository) : super(CatalogLoding());

  ShoppingRepository shoppingRepository;

  Stream<CatalogState> mapEventToState(CatalogEvent event) async* {
    if (event is CatalogStarted) {
      yield* _mapCatalogStartedToState();
    }
  }

  Stream<CatalogState> _mapCatalogStartedToState() async* {
    yield CatalogLoding();
    try {
      final catalog = await shoppingRepository.loadCatalog();
      yield CatalogLoded(Catalog(catalog));
    } catch (e) {
      yield CatalogError();
    }
  }
}

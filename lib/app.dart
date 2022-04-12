import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnblocpattern/cart/view/cart_page.dart';
import 'package:learnblocpattern/catalog/bloc/catalog_bloc.dart';
import 'package:learnblocpattern/catalog/view/catalog_page.dart';
import 'package:learnblocpattern/repository/shoping_repository.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CatalogBloc(ShoppingRepository())..add(CatalogStarted()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const CatalogPage(),
          '/cart': (context) => const CartPage(),
        },
      ),
    );
  }
}

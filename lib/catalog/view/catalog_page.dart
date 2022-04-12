import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnblocpattern/catalog/bloc/catalog_bloc.dart';
import 'package:learnblocpattern/catalog/models/item.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CatalogAppBar(),
          const SliverToBoxAdapter(
            child: SizedBox(height: 12),
          ),
          BlocBuilder<CatalogBloc, CatalogState>(builder: (context, state) {
            if (state is CatalogLoding) {
              return const SliverFillRemaining(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (state is CatalogLoded) {
              return SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return CatalogListItem(
                      item: state.catalog.getByPosition(index));
                }, childCount: state.catalog.itemNames.length),
              );
            } else {
              return const SliverFillRemaining(
                child: Center(
                  child: Text("Something Went Wrong"),
                ),
              );
            }
          }),
        ],
      ),
    );
  }
}

class CatalogListItem extends StatelessWidget {
  final Item? item;
  const CatalogListItem({
    this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: LimitedBox(
        maxHeight: 48,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: ColoredBox(color: item!.color),
            ),
            SizedBox(width: 24),
            Expanded(child: Text(item!.name)),
            SizedBox(width: 24),
            AddButton(),
          ],
        ),
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  const AddButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () {}, child: Text("ADD"));
  }
}

class CatalogAppBar extends StatelessWidget {
  const CatalogAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      title: const Text("Catalog"),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/cart');
          },
          icon: Icon(Icons.shopping_cart),
        )
      ],
    );
  }
}

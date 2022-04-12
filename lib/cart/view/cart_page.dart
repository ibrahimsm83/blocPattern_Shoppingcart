import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: ColoredBox(
        color: Colors.yellow,
        child: Column(
          children: [
            Expanded(
              child:
                  Padding(padding: const EdgeInsets.all(32), child: CartList()),
            ),
            Divider(height: 4, color: Colors.black),
            TotalPrice(),
          ],
        ),
      ),
    );
  }
}

class TotalPrice extends StatelessWidget {
  const TotalPrice({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        children: [
          Text("\$42",
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  ?.copyWith(fontSize: 48)),
         const SizedBox(height: 12),
          ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.black),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Buying not Started yet!"),
                ));
              },
              child: Text("Buy")),
        ],
      ),
    );
  }
}

class CartList extends StatelessWidget {
  const CartList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Material(
            child: ListTile(
              leading: Icon(Icons.done),
              title: Text("Code Smell",
                  style: Theme.of(context).textTheme.headline6),
            ),
          );
        });
  }
}

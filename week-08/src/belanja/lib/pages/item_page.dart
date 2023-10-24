import 'package:belanja/models/item.dart';
import 'package:belanja/widgets/custom_price.dart';
import 'package:belanja/widgets/custom_rating.dart';
import 'package:belanja/widgets/stock_status.dart';
import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});
  @override
  Widget build(BuildContext context) {
    final (itemArgs, index) =
        ModalRoute.of(context)!.settings.arguments as (Item, int);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Item"),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Hero(
                tag: "imageMovePage_$index",
                child: Image(
                  image: AssetImage(
                    itemArgs.imageUrl.toString(),
                  ),
                ),
              ),
            ),
            ItemDataPlaceholder(
              itemArgs: itemArgs,
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Text(
        "Mochammad Zaky Zamroni - 2141720117",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black54, fontSize: 12),
      ),
    );
  }
}

class ItemDataPlaceholder extends StatelessWidget {
  final Item itemArgs;
  const ItemDataPlaceholder({super.key, required this.itemArgs});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  itemArgs.name!,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomPrice(price: itemArgs.price),
                const SizedBox(
                  height: 10,
                ),
                StockStatus(stock: itemArgs.stok),
                const SizedBox(
                  height: 10,
                ),
                CustomRating(rating: itemArgs.rating)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
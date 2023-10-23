import 'package:belanja/models/item.dart';
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
                Text(
                  "Rp. ${itemArgs.price.toString()}",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text('Stok: ${itemArgs.stok}',
                    style: TextStyle(
                        color:
                            itemArgs.stok! < 10 ? Colors.red : Colors.green)),
                const SizedBox(
                  height: 10,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Text(itemArgs.rating.toString())
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class ItemDataDisplay extends StatelessWidget {
//   String? variable, data;
//   ItemDataDisplay({super.key, this.data, this.variable});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         Expanded(
//           flex: 1,
//           child: Text(
//             variable.toString(),
//             style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
//             textAlign: TextAlign.left,
//           ),
//         ),
//         const Expanded(
//           flex: 0,
//           child: Text(
//             ":",
//             textAlign: TextAlign.left,
//           ),
//         ),
//         Expanded(
//           child: Text(
//             data.toString(),
//             textAlign: TextAlign.left,
//           ),
//         ),
//       ],
//     );
//   }
// }
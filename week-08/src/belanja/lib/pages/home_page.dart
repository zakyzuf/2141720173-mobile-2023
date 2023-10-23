import 'package:belanja/models/item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Item> items = [
    Item(
      name: 'Tepung Beras 250gr',
      imageUrl:
          'assets/tpberas.jpg',
      price: 2200,
      stok: 30,
      rating: 4.4,
    ),
    Item(
      name: 'Minyak Goreng Sania 1L',
      imageUrl:
          'assets/minyakgoreng.jpg',
      price: 13800,
      stok: 70,
      rating: 4.8,
    ),
    Item(
      name: 'Beras Sania 5kg',
      imageUrl:
          'assets/beras.jpg',
      price: 76000,
      stok: 100,
      rating: 4.7,
    ),
    Item(
      name: 'Madu TJ 500gr',
      imageUrl:
          'assets/madu.jpeg',
      price: 55000,
      stok: 9,
      rating: 4.6,
    ),
    Item(
      name: 'Tepung Beras 250gr',
      imageUrl:
          'assets/tpberas.jpg',
      price: 2200,
      stok: 30,
      rating: 4.4,
    ),
    Item(
      name: 'Minyak Goreng Sania 1L',
      imageUrl:
          'assets/minyakgoreng.jpg',
      price: 13800,
      stok: 70,
      rating: 4.8,
    ),
    Item(
      name: 'Beras Sania 5kg',
      imageUrl:
          'assets/beras.jpg',
      price: 76000,
      stok: 8,
      rating: 4.7,
    ),
    Item(
      name: 'Madu TJ 500gr',
      imageUrl:
          'assets/madu.jpeg',
      price: 55000,
      stok: 40,
      rating: 4.6,
    ),
    Item(
      name: 'Tepung Beras 250gr',
      imageUrl:
          'assets/tpberas.jpg',
      price: 2200,
      stok: 30,
      rating: 4.4,
    ),
    Item(
      name: 'Minyak Goreng Sania 1L',
      imageUrl:
          'assets/minyakgoreng.jpg',
      price: 13800,
      stok: 7,
      rating: 4.8,
    ),
    Item(
      name: 'Beras Sania 5kg',
      imageUrl:
          'assets/beras.jpg',
      price: 76000,
      stok: 100,
      rating: 4.7,
    ),
    Item(
      name: 'Madu TJ 500gr',
      imageUrl:
          'assets/madu.jpeg',
      price: 55000,
      stok: 40,
      rating: 4.6,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Toko Tokoan"),
      ),
      body: Container(
        margin: const EdgeInsets.all(6),
        child: GridView.count(
          primary: false,
          crossAxisCount: 2,
          children: items
              .asMap()
              .entries
              .map((item) => ItemCard(
                    item: item.value,
                    index: item.key,
                  ))
              .toList(),
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

class ItemCard extends StatelessWidget {
  final Item item;
  final int index;
  const ItemCard({super.key, required this.item, required this.index});

  final String routeName = '/item';
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, routeName, arguments: (item, index));
        },
        child: Card(
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 96,
                  width: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Hero(
                      tag: "imageMovePage_$index",
                      child: Image(
                        image: AssetImage(
                          item.imageUrl.toString(),
                        ),
                      ),
                    ),
                  ),
                ),
                Text(item.name.toString(), style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600)),
                Text('Rp. ${item.price}'),
                Text('Stok: ${item.stok}', style: TextStyle(color: item.stok! < 10 ? Colors.red : Colors.green)),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    Text(item.rating.toString())
                  ]
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
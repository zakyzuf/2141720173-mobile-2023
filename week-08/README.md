# Praktikum 5: Membangun Navigasi di Flutter

## Langkah 1: Siapkan project baru
Buatlah sebuah project baru Flutter dengan nama belanja dan susunan folder seperti pada gambar berikut. Penyusunan ini dimaksudkan untuk mengorganisasi kode dan widget yang lebih mudah.</br>
![image](docs/images/langkah1_1.jpg)
![image](docs/images/langkah1_2.png)
</br>

# Langkah 2: Langkah 2: Mendefinisikan Route
Buatlah dua buah file dart dengan nama `home_page.dart` dan `item_page.dart` pada folder <b>pages</b>. Untuk masing-masing file, deklarasikan class `HomePage` pada file `home_page.dart` dan ItemPage pada `item_page.dart`. Turunkan class dari `StatelessWidget`. Gambaran potongan kode dapat anda lihat sebagai berikut.

```dart
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        throw UnimplementedError();
    }
}
```

```dart
import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        throw UnimplementedError();
    }
}
```

## Langkah 3: Lengkapi Kode di main.dart
Setelah kedua halaman telah dibuat dan didefinisikan, bukalah file `main.dart`. Pada langkah ini anda akan mendefinisikan <b>Route</b> untuk kedua halaman tersebut. Definisi penamaan <b>route</b> harus bersifat <b>unique</b>. Halaman <b>HomePage</b> didefinisikan sebagai /. Dan halaman <b>ItemPage</b> didefinisikan sebagai /<b>item</b>. Untuk mendefinisikan halaman awal, anda dapat menggunakan `named argument initialRoute`. Gambaran tahapan ini, dapat anda lihat pada potongan kode berikut.

```dart
import 'package:belanja/pages/home_page.dart';
import 'package:belanja/pages/item_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/item': (context) => ItemPage()
      },
    ),
  );
}
```

## Langkah 4: Membuat data model
Sebelum melakukan perpindahan halaman dari `HomePage` ke `ItemPage`, dibutuhkan proses pemodelan data. Pada desain mockup, dibutuhkan dua informasi yaitu nama dan harga. Untuk menangani hal ini, buatlah sebuah file dengan nama `item.dart` dan letakkan pada folder <b>models</b>. Pada file ini didefinisikan pemodelan data yang dibutuhkan. Ilustrasi kode yang dibutuhkan, dapat anda lihat pada potongan kode berikut.

```dart
class Item {
  String? name;
  int? price;

  Item({this.name, this.price});
}
```

## Langkah 5: Lengkapi kode di class HomePage
Pada halaman `HomePage` terdapat `ListView` widget. Sumber data `ListView` diambil dari model List dari object Item. Gambaran kode yang dibutuhkan untuk melakukan definisi model dapat anda lihat sebagai berikut.

```dart
  final List<Item> items = [
    Item(name: 'Sugar', price: 5000),
    Item(name: 'Salt', price: 2000),
  ];
```

## Langkah 6: Membuat ListView dan itemBuilder
Untuk menampilkan `ListView` pada praktikum ini digunakan `itemBuilder`. Data diambil dari definisi model yang telah dibuat sebelumnya. Untuk menunjukkan batas data satu dan berikutnya digunakan widget `Card`. Kode yang telah umum pada bagian ini tidak ditampilkan. Gambaran kode yang dibutuhkan dapat anda lihat sebagai berikut.

```dart
Container(
      margin: const EdgeInsets.all(8),
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Material(
              child: Card(
                child: Container(
                  margin: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Expanded(child: Text(item.name.toString())),
                      Expanded(
                        child: Text(
                          item.price.toString(),
                          textAlign: TextAlign.end,
                        ),
                      )
                    ],
                  ),
                ),
          );
        },
      ),
    );
```

## Langkah 7: Menambahkan aksi pada ListView
Item pada ListView saat ini ketika ditekan masih belum memberikan aksi tertentu. Untuk menambahkan aksi pada ListView dapat digunakan widget `InkWell` atau `GestureDetector`. Perbedaan utamanya `InkWell` merupakan material widget yang memberikan efek ketika ditekan. Sedangkan `GestureDetector` bersifat umum dan bisa juga digunakan untuk gesture lain selain sentuhan. Pada praktikum ini akan digunakan widget `InkWell`.

Untuk menambahkan sentuhan, letakkan cursor pada widget pembuka `Card`. Kemudian gunakan shortcut quick fix dari VSCode (<b>Ctrl +</b> . pada Windows atau <b>Cmd +</b> . pada MacOS). Sorot menu <b>wrap with widget...</b> Ubah nilai widget menjadi `InkWell` serta tambahkan named argument `onTap` yang berisi fungsi untuk berpindah ke halaman `ItemPage`. Ilustrasi potongan kode dapat anda lihat pada potongan berikut.
</br>
Kode pada file `home_page.dart`

```dart

import 'package:belanja/models/item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Item> items = [
    Item(name: 'Sugar', price: 5000),
    Item(name: 'Salt', price: 2000),
  ];
  final routeName = '/item';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping List'),
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Material(
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, routeName, arguments: item);
                },
                child: Card(
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Expanded(child: Text(item.name.toString())),
                        Expanded(
                          child: Text(
                            item.price.toString(),
                            textAlign: TextAlign.end,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
```

Kode pada file `item_page.dart`</br>

```dart
import 'package:belanja/models/item.dart';
import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});
  @override
  Widget build(BuildContext context) {
    final itemArgs = ModalRoute.of(context)!.settings.arguments as Item;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping List'),
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  itemArgs.name.toString(),
                  style: const TextStyle(fontSize: 24),
                ),
                const SizedBox(width: 6),
                const Text(
                  'with',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(width: 6),
                Text(
                  itemArgs.price.toString(),
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
      ),
    );
  }
}
```

Output:</br>
![gif](docs/gifs/output_praktikum.gif)
</br>

# Tugas Praktikum
1. Untuk melakukan pengiriman data ke halaman berikutnya, cukup menambahkan informasi arguments pada penggunaan Navigator. Perbarui kode pada bagian Navigator menjadi seperti berikut.
   ```dart
   Navigator.pushNamed(context, '/item', arguments: item);
   ```
2. Pembacaan nilai yang dikirimkan pada halaman sebelumnya dapat dilakukan menggunakan ModalRoute. Tambahkan kode berikut pada blok fungsi build dalam halaman ItemPage. Setelah nilai didapatkan, anda dapat menggunakannya seperti penggunaan variabel pada umumnya.
   ```dart
   final itemArgs = ModalRoute.of(context)!.settings.arguments as Item;
   ```
3. Pada hasil akhir dari aplikasi belanja yang telah anda selesaikan, tambahkan atribut foto produk, stok, dan rating. Ubahlah tampilan menjadi GridView seperti di aplikasi marketplace pada umumnya.
<a href="https://docs.flutter.dev/cookbook/navigation/navigate-with-arguments">https://docs.flutter.dev/cookbook/navigation/navigate-with-arguments</a>
4. Silakan implementasikan Hero widget pada aplikasi belanja Anda dengan mempelajari dari sumber ini:
<a href="https://docs.flutter.dev/cookbook/navigation/hero-animations">https://docs.flutter.dev/cookbook/navigation/hero-animations</a>

5. Sesuaikan dan modifikasi tampilan sehingga menjadi aplikasi yang menarik. Selain itu, pecah widget menjadi kode yang lebih kecil. Tambahkan Nama dan NIM di footer aplikasi belanja Anda.</br>
    Memecah widget menjadi file tersendiri:</br>
    `custom_price.dart`:

    ```dart
    import 'package:flutter/material.dart';
    import 'package:intl/intl.dart';

    class CustomPrice extends StatelessWidget {
      final int price;

      const CustomPrice({Key? key, required this.price}) : super(key: key);

      @override
      Widget build(BuildContext context) {
        final formattedPrice = NumberFormat.currency(
          locale: 'id_ID', 
          symbol: 'Rp',
        ).format(price);

        return Text(
          formattedPrice,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            height: 1.5,
            color: Colors.black,
          ),
        );
      }
    }
    ```
    </br>

    `custom_rating.dart`:
    ```dart
    import 'package:flutter/material.dart';

    class CustomRating extends StatelessWidget {
      final double? rating;

      const CustomRating({Key? key, required this.rating}) : super(key: key);

      @override
      Widget build(BuildContext context) {
        return Row(
          children: [
            const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            Text(
              rating.toString(),
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ],
        );
      }
    }
    ```
    </br>

    `stock_status.dart`:
    ```dart
    import 'package:flutter/material.dart';

    class StockStatus extends StatelessWidget {
      final int stock;

      const StockStatus({Key? key, required this.stock}) : super(key: key);

      @override
      Widget build(BuildContext context) {
        Color textColor = stock < 10 ? Colors.red : Colors.green;
        String status = stock < 10 ? 'Stok hampir habis, stok: $stock' : 'Stok tersedia, stok: $stock';

        return Text(
          status,
          style: TextStyle(
            color: textColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        );
      }
    }
    ```
    </br>

    Mengubah file `item.dart`, `home_page.dart`, `item_page.dart` untuk menggunakan widget yang telah dipecah.
    
    </br>

    `item.dart`:

    ```dart
    class Item {
      String? name, imageUrl;
      int price, stok;
      double? rating;

      Item({this.name, this.imageUrl, required this.price, required this.stok, this.rating});
    }
    ```
    </br>

    `home_page.dart`:

    ```dart
    import 'package:belanja/models/item.dart';
    import 'package:belanja/widgets/custom_price.dart';
    import 'package:belanja/widgets/custom_rating.dart';
    import 'package:belanja/widgets/stock_status.dart';
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
                    CustomPrice(price: item.price),
                    StockStatus(stock: item.stok),
                    CustomRating(rating: item.rating)
                  ],
                ),
              ),
            ),
          ),
        );
      }
    }
    ```
    </br>

    `item_page.dart`:

    ```dart
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
    ```

    </br>
6. Selesaikan Praktikum Navigasi dan Rute tersebut, lalu dokumentasikan dan push ke repository Anda berupa screenshot setiap hasil pekerjaan beserta penjelasannya di file README.md. Kumpulkan link commit repository GitHub Anda ke spreadsheet yang telah disediakan!

</br>
Output:</br>

![gif](docs/gifs/output_tugas.gif)</br>


import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  Widget titleSection = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          /* soal 1*/
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /* soal 2*/
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: const Text(
                  'Coban Rondo',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Text('Batu, Malang, Indonesia',
                  style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
        /* soal 3*/
        const Icon(
          Icons.star,
          color: Colors.red,
        ),
        const Text('4.5'),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'Coban Rondo memiliki ketinggian sekitar 84 meter. Sedangkan, lokasi air terjun berada pada ketinggian 1.134 meter di atas permukaan laut. Udara di sekitar sejuk dan tempat yang sesuai untuk liburan.'
        'Dengan air terjun yang cukup tinggi, pengunjung yang mendekati air terjun akan terkena titik-titik air yang diterbangkan angin. Semakin dekat air terjun, pakaian akan semakin basah. Selain melihat panorama air terjun yang turun dari tebing, pengelola juga menyediakan sejumlah fasilitas wisata, seperti camping ground, tempat pemancingan, jogging track, penginapan, lintasan sepeda gunung, mengitari labirin, maupun persemian tanaman hutan.',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Flutter layout: Mochammad Zaky Zamroni - 2141720173',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: ListView(
          children: [
            Image.asset(
              'images/image.png',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection, 
            buttonSection, 
            textSection
            ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
import 'dart:async';
import 'package:flutter/material.dart';

import 'basic_widget/date_time_widget.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: MyDateTime(title: 'Contoh Date Picker',),
      ),
    );
  }
}



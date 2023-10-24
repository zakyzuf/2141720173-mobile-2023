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

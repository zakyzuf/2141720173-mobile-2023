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

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medhealth/theme.dart';

class CardProduct extends StatelessWidget {
  //Parameter
  final String imageProduct;
  final String nameProduct;
  final String price;
  //Constructor
  CardProduct({this.imageProduct, this.nameProduct, this.price});

  @override
  Widget build(BuildContext context) {
    final priceFormat = NumberFormat("#,##0", "EN_US");
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Image.network(
            imageProduct,
            width: 115,
            height: 60,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            nameProduct,
            style: regulerTextStyle.copyWith(fontSize: 10),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Rp " + priceFormat.format(int.parse(price)),
            style: boldTextStyle,
          ),
        ],
      ),
    );
  }
}

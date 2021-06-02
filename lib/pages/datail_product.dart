import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medhealth/network/model/product_model.dart';
import 'package:medhealth/widget/button_primary.dart';

import '../theme.dart';

class DetailProduct extends StatefulWidget {
  final ProductModel productModel;
  DetailProduct(this.productModel);

  @override
  _DetailProductState createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  final priceFormat = NumberFormat("#,##0", "EN_US");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(24, 24, 24, 0),
              height: 70,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_rounded,
                      size: 30,
                      color: greenColor,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Detail Product",
                    style: regulerTextStyle.copyWith(fontSize: 24),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 180,
              color: whiteColor,
              child: Image.network(
                widget.productModel.imageProduct,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.productModel.nameProduct,
                    style: regulerTextStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    widget.productModel.description,
                    style: regulerTextStyle.copyWith(
                        fontSize: 12, color: greyBoldColor),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Row(
                    children: [
                      Spacer(),
                      Text(
                        "Rp " +
                            priceFormat
                                .format(int.parse(widget.productModel.price)),
                        style: boldTextStyle.copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: ButtonPrimary(
                      onTap: () {},
                      text: "ADD TO CART",
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

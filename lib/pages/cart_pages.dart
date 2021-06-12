import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:medhealth/network/api/url_api.dart';
import 'package:medhealth/network/model/cart_model.dart';
import 'package:medhealth/network/model/pref_profile_model.dart';
import 'package:medhealth/widget/button_primary.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../theme.dart';

class CartPages extends StatefulWidget {
  @override
  _CartPagesState createState() => _CartPagesState();
}

class _CartPagesState extends State<CartPages> {
  String userID, fullName, address, phone;
  int delivery = 0;
  getPref() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      userID = sharedPreferences.getString(PrefProfile.idUser);
      fullName = sharedPreferences.getString(PrefProfile.name);
      address = sharedPreferences.getString(PrefProfile.address);
      phone = sharedPreferences.getString(PrefProfile.phone);
    });
    getCart();
  }

  List<CartModel> listCart = [];
  getCart() async {
    listCart.clear();
    var urlGetCart = Uri.parse(BASEURL.getProductCart + userID);
    final response = await http.get(urlGetCart);
    if (response.statusCode == 200) {
      setState(() {
        final data = jsonDecode(response.body);
        for (Map item in data) {
          listCart.add(CartModel.fromJson(item));
        }
      });
      print(listCart[0].name);
    }
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: EdgeInsets.all(24),
        height: 230,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Color(0xfffcfcfc),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Items",
                  style: regulerTextStyle.copyWith(
                      fontSize: 16, color: greyBoldColor),
                ),
                Text(
                  "4",
                  style: boldTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Delivery Fee",
                  style: regulerTextStyle.copyWith(
                      fontSize: 16, color: greyBoldColor),
                ),
                Text(
                  delivery == 0 ? "FREE" : delivery,
                  style: boldTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Payment",
                  style: regulerTextStyle.copyWith(
                      fontSize: 16, color: greyBoldColor),
                ),
                Text(
                  "IDR 180.000",
                  style: boldTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Container(
              width: MediaQuery.of(context).size.width,
              child: ButtonPrimary(
                onTap: () {},
                text: "CHECKOUT NOW",
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(bottom: 220),
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
                    "My Cart",
                    style: regulerTextStyle.copyWith(fontSize: 24),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(24),
              height: 166,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Delivery Destination",
                    style: regulerTextStyle.copyWith(fontSize: 18),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Name",
                        style: regulerTextStyle.copyWith(
                            fontSize: 16, color: greyBoldColor),
                      ),
                      Text(
                        "$fullName",
                        style: boldTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Address",
                        style: regulerTextStyle.copyWith(
                            fontSize: 16, color: greyBoldColor),
                      ),
                      Text(
                        "$address",
                        style: boldTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Phone",
                        style: regulerTextStyle.copyWith(
                            fontSize: 16, color: greyBoldColor),
                      ),
                      Text(
                        "$phone",
                        style: boldTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListView.builder(
                itemCount: listCart.length,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, i) {
                  final x = listCart[i];
                  return Container(
                    padding: EdgeInsets.all(24),
                    color: whiteColor,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.network(
                              x.image,
                              width: 115,
                              height: 100,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 200,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    x.name,
                                    style:
                                        regulerTextStyle.copyWith(fontSize: 16),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                          Icons.add_circle,
                                          color: greenColor,
                                        ),
                                        onPressed: () {},
                                      ),
                                      Text(x.quantity),
                                      IconButton(
                                        icon: Icon(
                                          Icons.remove_circle,
                                          color: Color(0xfff0997a),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                  Text(
                                    x.price,
                                    style: boldTextStyle.copyWith(fontSize: 16),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Divider()
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}

import 'package:ecommerce_app/containers/category_container.dart';
import 'package:ecommerce_app/containers/discount_container.dart';
import 'package:ecommerce_app/containers/home_page_maker_container.dart';
import 'package:ecommerce_app/containers/promo_container.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "home page"
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PromoContainer(),
            DiscountContainer(),
            CategoryContainer(),
            HomePageMakerContainer(),
          ],
        ),
      ),
    );
  }
}
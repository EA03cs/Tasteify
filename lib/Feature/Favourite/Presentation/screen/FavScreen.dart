import 'package:flutter/material.dart';
import 'package:tasteify/Core/widgets/custAppBaar.dart';
import 'package:tasteify/Core/widgets/productGrid.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "المفضلة"),
      body: Column(
        children: [
          ProductsGridView()
        ],
      ),
    );
  }
}

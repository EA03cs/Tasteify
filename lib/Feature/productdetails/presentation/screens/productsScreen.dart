import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasteify/Core/widgets/SearchField.dart';
import 'package:tasteify/Core/widgets/custAppBaar.dart';
import 'package:tasteify/Core/widgets/productGrid.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: name),
      body: Padding(
        padding: EdgeInsets.all(8.0.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SearchField(),
              const SizedBox(height: 16),
              const ProductsGridView(),
            ],
          ),
        ),
      ),
    );
  }
}


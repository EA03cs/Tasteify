import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasteify/Core/widgets/ProductCard.dart';
import 'package:tasteify/Feature/Categories/ViewModel/model/CategoryWithProducts.dart';

class SearchResults extends StatelessWidget {
  final List<Product> products;

  const SearchResults({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
        mainAxisExtent: 180.h,
      ),
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCard(
          imagePath: product.imageUrl,
          productName: product.name,
          price: '${(product.discountedPrice ?? product.unitPrice).toStringAsFixed(2)} ج.م',
          discount: product.discountPercentage,
          isWeighedProduct: product.isWeighedProduct,
          unitSymbol: product.unitSymbol,
          isFavorite: false,
          onFavoritePressed: () {},
          onAddPressed: () {},
        );
      },
    );
  }
}
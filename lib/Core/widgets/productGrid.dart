import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasteify/Core/widgets/productCard.dart';

class ProductsGridView extends StatefulWidget {
  const ProductsGridView({super.key});

  @override
  State<ProductsGridView> createState() => _ProductsGridViewState();
}

class _ProductsGridViewState extends State<ProductsGridView> {
  final List<Map<String, dynamic>> products = [
    {
      'image': 'assets/Frame 11075 (3).png',
      'name': 'فراولة',
      'price': '30جنية / الكيلو',
      'isFavorite': false,
    },
    {
      'image': 'assets/Frame 11075 (2).png',
      'name': 'برتقال',
      'price': '25جنية / الكيلو',
      'discount': '20%off',
      'isFavorite': false,
    },
    {
      'image': 'assets/Frame 11075 (1).png',
      'name': 'تفاح',
      'price': '35جنية / الكيلو',
      'discount': '20%off',
      'isFavorite': false,
    },
    {
      'image': 'assets/Frame 11075.png',
      'name': 'موز',
      'price': '20جنية / الكيلو',
      'discount': '20%off',
      'isFavorite': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
        mainAxisExtent: 180.h,
        childAspectRatio: 0.7.w,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductCard(
          imagePath: products[index]['image'],
          productName: products[index]['name'],
          price: products[index]['price'],
          discount: products[index]['discount'],
          isFavorite: products[index]['isFavorite'],
          onAddPressed: () {
            print('Added ${products[index]['name']} to cart');
          },
          onFavoritePressed: () {
            setState(() {
              products[index]['isFavorite'] = !products[index]['isFavorite'];
            });
          },
        );
      },
    );
  }
}

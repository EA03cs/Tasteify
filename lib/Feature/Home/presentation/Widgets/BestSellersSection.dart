import 'package:flutter/material.dart';
import 'package:tasteify/Core/utils/appText.dart';
import 'package:tasteify/Core/utils/colors.dart';
import 'package:tasteify/Core/widgets/productGrid.dart';

class BestSellersSection extends StatelessWidget {
  const BestSellersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeader(),
        const ProductsGridView(),
      ],
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Text('الأكثر مبيعاً', style: AppTextStyles.subtitleStyle),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: Text(
            'عرض الكل',
            style: AppTextStyles.bodyStyle.copyWith(
              color: AppColors.primaryRed,
            ),
          ),
        ),
      ],
    );
  }
}
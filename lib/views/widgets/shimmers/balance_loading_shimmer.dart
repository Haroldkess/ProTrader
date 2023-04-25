import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BalanceShimmer extends StatelessWidget {
  const BalanceShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Shimmer.fromColors(
      loop: 30,
      baseColor: theme.colorScheme.secondary,
      highlightColor: primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                enabled: true,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: theme.colorScheme.secondary),
                  height: 12,
                  width: 140,
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: primaryColor),
                  height: 12,
                  width: 45,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: primaryColor),
              height: 12,
              width: 140,
            ),
          ),
        ],
      ),
    );
  }
}

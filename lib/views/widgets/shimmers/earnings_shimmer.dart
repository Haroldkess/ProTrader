import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class EarningShimmer extends StatelessWidget {
  const EarningShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Shimmer.fromColors(
      loop: 30,
      baseColor: theme.colorScheme.secondary,
      highlightColor: theme.colorScheme.primary,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 92.5,
                    width: double.infinity,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                    decoration: BoxDecoration(
                        color: theme.colorScheme.secondary,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Container(
                    height: 92.5,
                    width: double.infinity,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                    decoration: BoxDecoration(
                        color: theme.colorScheme.secondary,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
    
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16),
          //   child: Row(
          //     children: [
          //       Expanded(
          //         child: Container(
          //           height: 92.5,
          //           width: double.infinity,
          //           padding:
          //               const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
          //           decoration: BoxDecoration(
          //               color: theme.colorScheme.secondary,
          //               borderRadius: BorderRadius.circular(10)),
          //         ),
          //       ),
          //       const SizedBox(
          //         width: 12,
          //       ),
          //       Expanded(
          //         child: Container(
          //           height: 92.5,
          //           width: double.infinity,
          //           padding:
          //               const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
          //           decoration: BoxDecoration(
          //               color: theme.colorScheme.secondary,
          //               borderRadius: BorderRadius.circular(10)),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
    
        ],
      ),
    );
  }
}

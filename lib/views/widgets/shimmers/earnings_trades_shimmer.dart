import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../constants/colors/colors.dart';

class ListShimmer extends StatelessWidget {
  ListShimmer({
    super.key,
  });

  List<Container> container(BuildContext context) {
    var theme = Theme.of(context);
    List<Container> containers = List.generate(8, (index) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 19.5),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color: theme.colorScheme.primary,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 11,
                  width: 24,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: theme.colorScheme.primary),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: 11,
                  width: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 11,
                  width: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: 88,
                  height: 28,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: const Color(0xff8494A8)),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 11,
                  width: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: 11,
                  width: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 11,
                  width: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: 11,
                  width: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            )
          ],
        ),
      );
    });
    return containers;
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Shimmer.fromColors(
      loop: 30,
      baseColor: theme.colorScheme.secondary,
      highlightColor: theme.colorScheme.primary,
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: container(context).toList(),
        ),
      ),
    );
  }
}

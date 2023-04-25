import 'package:flutter/material.dart';

import '../constants/colors/colors.dart';
import 'grid_card.dart';

class HomePageGrid extends StatelessWidget {
  const HomePageGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
    
        Row(
          children: [
            GridCard(
              title: "Bot Balance",
              amount: "\$53.5",
              textColor: appWhite,
            ),
            GridCard(
                title: "Network Income",
                amount: "\$120.88",
                textColor: appWhite)
          ],
        ),
      ],
    );

    // return GridView.count(
    //   physics: const BouncingScrollPhysics(),
    //   shrinkWrap: true,
    //   padding: const EdgeInsets.only(left: 16, right: 16),
    //   crossAxisCount: 2,
    //   mainAxisSpacing: 16,
    //   crossAxisSpacing: 16,
    //   children: [
    //
    //   ],
    // );
  }
}

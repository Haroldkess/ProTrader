import 'package:crypto_credit/views/constants/colors/colors.dart';
import 'package:crypto_credit/views/widgets/bolllinger_tab_table.dart';
import 'package:crypto_credit/views/widgets/kDivider.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_fields.dart';

class BollingerTab extends StatelessWidget {
  const BollingerTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:   [
              Expanded(flex: 3, child: RoundedTextField(leading: Icon(Icons.search))),
            const SizedBox(
              width: 22,
            ),
            Expanded(
                flex: 2,
                child: CustomMidButton(
                  borderR: 10,
                  fontSize: 10,
                  color: appGreen,
                  text: "Get Signals",
                ))
          ],
        ),


        KDivider(hP: 0, padding: 10,),
        BollingerTabTable(),
        




   
   
      ],
    );
  }
}



      // SettingsContainer(
      //           hP: 0, vP: 0,
      //           children: [
      //             DefaultTabController(
      //               length: 3,
      //               child: Column(
      //                 children: [
      //                   Container(
      //                     decoration: BoxDecoration(
      //                       color: Color(0xff2D1F3B66),
                            
      //                     ),
      //                     child: TabBar(
      //                       tabs: [
      //                         Text(
      //                           "BOLLINGER",
      //                           style: tabTextStyle,
      //                         ),
      //                         Text(
      //                           "RSI",
      //                           style: tabTextStyle,
      //                         ),
      //                         Text(
      //                           "SIGNALS",
      //                           style: tabTextStyle,
      //                         )
      //                       ],
      //                       unselectedLabelColor: lightTextColor,
      //                       labelColor: appWhite,
      //                       indicator: BoxDecoration(
      //                         color: Color(0xff3A284C),
      //                         borderRadius: const BorderRadius.all(
      //                           Radius.circular(10),
      //                         ),
      //                         // overlayColor: MaterialStateProperty.all(Colors.grey),
      //                       ),
      //                       padding: const EdgeInsets.symmetric(
      //                           vertical: 0, horizontal: 25),
      //                       labelPadding: const EdgeInsets.symmetric(
      //                           horizontal: 0, vertical: 15),
      //                       isScrollable: false,
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ],
      //         )
         
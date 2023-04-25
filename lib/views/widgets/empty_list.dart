import 'dart:math';

import 'package:flutter/material.dart';

import '../constants/colors/colors.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../constants/textDecoration/text_decoration.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({super.key, this.myText});

  final Widget? myText;

  Animate get a => myText!
      .animate(onPlay: (controller) => controller.repeat())
      .effect(duration: 3000.ms) // this "pads out" the total duration
      .effect(delay: 750.ms, duration: 1500.ms);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
          ),
          Container(
              height: 82,
              width: 82,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: theme.colorScheme.secondary),
              child: Icon(
                Icons.not_interested_sharp,
                color: theme.textTheme.titleLarge!.color,
                size: 32,
              )),
          SizedBox(
            height: 20,
          ),

          Text(
            "Nothing to Show here",
            style: appTextStyle.copyWith(
                color: theme.textTheme.titleLarge!.color, fontSize: 16),
          )
          //     ).animate(onPlay: (controller) => controller.repeat())
          // .effect(duration: 3000.ms) // this "pads out" the total duration
          // .effect(delay: 750.ms, duration: 1500.ms).shimmer(
          //             angle: pi / 4,
          //             size: 3,
          //             colors: [appWhite,primaryColor],
          //             curve: Curves.easeInOutCirc,)
        ],
      ),
    );
  }
}

class LoadingListExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Animate(
            delay: Duration(milliseconds: 500),
            child: Container(),
          );
        },
      ),
    );
  }
}

// class LoadingListTile extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: CircularAnimate(
//         child: Icon(Icons.image),
//       ),
//       title: LinearAnimate(
//         child: Text('Loading...'),
//       ),
//       subtitle: LinearAnimate(
//         child: Text('Please wait...'),
//       ),
//     );
//   }
// }

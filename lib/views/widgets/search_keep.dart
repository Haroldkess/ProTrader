    // body: Column(
        //   children: [
        //     Expanded(
        //       child: SearchableList<TopTradesModel>(
        //           inputDecoration: InputDecoration(
        //             labelText: "Search Actor",
        //             fillColor: Colors.white,
        //             focusedBorder: OutlineInputBorder(
        //               borderSide: const BorderSide(
        //                 color: Colors.blue,
        //                 width: 1.0,
        //               ),
        //               borderRadius: BorderRadius.circular(10.0),
        //             ),
        //           ),
        //           emptyWidget: EmptyList(
        //             myText: Text("Empty"),
        //           ),
        //           errorWidget: Column(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: const [
        //               Icon(
        //                 Icons.error,
        //                 color: Colors.red,
        //               ),
        //               SizedBox(
        //                 height: 20,
        //               ),
        //               Text('Error while fetching actors')
        //             ],
        //           ),
        //           asyncListFilter: (p0, p1) {
        //             return p1.where((element) {
        //               return element.symbol.contains(p0);
        //             }).toList();
        //           },
        //           asyncListCallback: () async {
        //             await Future.delayed(
        //               const Duration(
        //                 milliseconds: 10000,
        //               ),
        //             );
        //             return getAllTopTradesList();
        //           },
        //           loadingWidget: const CircularProgressIndicator(),
        //           builder: (TopTradesModel e) {
        //             log(e);
        //             return TradePairWiseCard(
        //               topTradesModel: e,
        //             );
        //           }),
        //     ),
        //   ],
        // ),
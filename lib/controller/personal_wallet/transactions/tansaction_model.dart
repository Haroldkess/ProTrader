class Transaction {
  String coin;
  String date;
  String status;
  String value;
  String description;

  Transaction(
      {required this.date,
      required this.status,
      required this.value,
      required this.coin,
      required this.description});
}

List<Transaction> tansHistory = [
  // Transaction(
  //     date: "2019/01/02	",
  //     status: "PENDING	",
  //     value: "19,0000",
  //     coin: "BTC-USDT",
  //     description: "Lorem ipsum dolor sit amet."),
  // Transaction(
  //     date: "2019/01/02	",
  //     status: "PENDING	",
  //     value: "19,0000",
  //     coin: "BTC-USDT",
  //     description: "Lorem ipsum dolor sit amet."),
  // Transaction(
  //     date: "2019/01/02	",
  //     status: "PENDING	",
  //     value: "19,0000",
  //     coin: "BTC-USDT",
  //     description: "Lorem ipsum dolor sit amet."),
  // Transaction(
  //     date: "2019/01/02	",
  //     status: "PENDING	",
  //     value: "19,0000",
  //     coin: "BTC-USDT",
  //     description: "Lorem ipsum dolor sit amet."),
];

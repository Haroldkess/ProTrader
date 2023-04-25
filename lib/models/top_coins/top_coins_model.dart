class TopCoinsModel {
  dynamic symbol;
  dynamic close;
  dynamic percentage;
  dynamic change;
  dynamic open;

  TopCoinsModel();

  TopCoinsModel.fromJson(Map<String, dynamic> json) {
    symbol = json['symbol'];
    open = json['open'];
    close = json['close'];
    percentage = json['percentage'];
    change = json['change'];
  }
}

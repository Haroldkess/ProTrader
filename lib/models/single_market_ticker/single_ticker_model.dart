class SingleMarketTickerModel {
  int? id;
  String? batch;
  String? unix;
  String? date;
  String? symbol;
  String? open;
  String? high;
  String? low;
  String? close;
  String? change;
  String? percentage;
  String? tradecount;
  int? average;
  String? baseVolume;
  String? timeframe;
  String? createdAt;
  String? updatedAt;

  SingleMarketTickerModel();

  SingleMarketTickerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    batch = json['batch'];
    unix = json['unix'];
    date = json['date'];
    symbol = json['symbol'];
    open = json['open'];
    high = json['high'];
    low = json['low'];
    close = json['close'];
    change = json['change'];
    percentage = json['percentage'];
    tradecount = json['tradecount'];
    average = json['average'];
    baseVolume = json['base_volume'];
    timeframe = json['timeframe'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

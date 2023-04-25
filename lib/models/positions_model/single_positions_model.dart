class SinglePostionsModel {
  int? id;
  String? positionId;
  String? userId;
  String? symbol;
  String? side;
  String? mode;
  String? leverage;
  String? size;
  String? firstPrice;
  String? startPrice;
  String? endPrice;
  String? nextMcost;
  String? nextMprice;
  String? liquidation;
  String? targetProfit;
  String? closeBy;
  String? trader;
  String? status;
  String? cycle;
  String? margin;
  String? pnl;
  String? roe;
  String? changes;
  String? pnlStatus;
  Map<String, dynamic>? robotSettings;
  String? createdAt;
  String? updatedAt;
  CryptoMarketTicker? cryptoMarketTicker;

  SinglePostionsModel();

  SinglePostionsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    positionId = json['position_id'];
    userId = json['user_id'];
    symbol = json['symbol'];
    side = json['side'];
    mode = json['mode'];
    leverage = json['leverage'];
    size = json['size'];
    firstPrice = json['first_price'];
    startPrice = json['start_price'];
    endPrice = json['end_price'];
    nextMcost = json['next_mcost'];
    nextMprice = json['next_mprice'];
    liquidation = json['liquidation'];
    targetProfit = json['target_profit'];
    closeBy = json['close_by'];
    trader = json['trader'];
    status = json['status'];
    cycle = json['cycle'];
    margin = json['margin'];
    pnl = json['pnl'];
    roe = json['roe'];
    changes = json['changes'];
    pnlStatus = json['pnl_status'];
    robotSettings = json['robot_settings'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    cryptoMarketTicker = json['crypto_market_ticker'] != null
        ? CryptoMarketTicker.fromJson(json['crypto_market_ticker'])
        : null;
  }
}

class CryptoMarketTicker {
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

  CryptoMarketTicker();

  CryptoMarketTicker.fromJson(Map<String, dynamic> json) {
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

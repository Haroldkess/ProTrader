class TopTradesModel {
  dynamic profitSum;
  dynamic lossSum;
  dynamic trades;
  dynamic symbol;

  TopTradesModel({this.profitSum, this.lossSum, this.trades, this.symbol});

  TopTradesModel.fromJson(Map<String, dynamic> json) {
    profitSum = json['profit_sum'];
    lossSum = json['loss_sum'];
    trades = json['trades'];
    symbol = json['symbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profit_sum'] = this.profitSum;
    data['loss_sum'] = this.lossSum;
    data['trades'] = this.trades;
    data['symbol'] = this.symbol;
    return data;
  }
}


class TopTradeStats {
  dynamic profit;
dynamic profitTrade;
 dynamic profitPercent;
  dynamic loss;
dynamic lossTrade;
dynamic lossPercent;

  TopTradeStats(
      {this.profit,
      this.profitTrade,
      this.profitPercent,
      this.loss,
      this.lossTrade,
      this.lossPercent});

  TopTradeStats.fromJson(Map<String, dynamic> json) {
    profit = json['profit'];
    profitTrade = json['profit_trade'];
    profitPercent = json['profit_percent'];
    loss = json['loss'];
    lossTrade = json['loss_trade'];
    lossPercent = json['loss_percent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profit'] = this.profit;
    data['profit_trade'] = this.profitTrade;
    data['profit_percent'] = this.profitPercent;
    data['loss'] = this.loss;
    data['loss_trade'] = this.lossTrade;
    data['loss_percent'] = this.lossPercent;
    return data;
  }
}

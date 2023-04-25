class DashboardData {
  dynamic totalEarnings;
  dynamic tradeProfit;
  dynamic botBalance;
  dynamic networkIncome;
  dynamic exchangeBalance;
  String? mode;

  DashboardData(
      );

  DashboardData.fromJson(Map<String, dynamic> json) {
    totalEarnings = json['TotalEarnings'];
    tradeProfit = json['TradeProfit'];
    botBalance = json['BotBalance'];
    networkIncome = json['NetworkIncome'];
    exchangeBalance = json['ExchangeBalance'];
    mode = json['mode'];
  }

 
}

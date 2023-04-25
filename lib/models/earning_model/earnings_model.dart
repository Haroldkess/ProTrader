class Earnings {
  dynamic todaysProfit;
  dynamic cumulativeProfit;
  dynamic totalInvestment;
  dynamic avgPercentage;

  Earnings();

  Earnings.fromJson(Map<String, dynamic> json) {
    todaysProfit = json['todays_profit'];
    cumulativeProfit = json['cumulative_profit'];
    totalInvestment = json['total_investment'];
    avgPercentage = json['avg_percentage'];
  }
}

class EarningsPositions {
  dynamic returni;
  String? date;
  dynamic profit;
  dynamic fund;

  EarningsPositions();

  EarningsPositions.fromJson(Map<String, dynamic> json) {
    returni = json['return'];
    date = json['date'];
    profit = json['profit'];
    fund = json['fund'];
  }
}

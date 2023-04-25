class RobotSettingsModel {
  dynamic trader;
  dynamic myCost;
  dynamic leverage;
   dynamic noOfCycles;
  dynamic marginCallLimit;
  dynamic totalCost;
  List<Margins>? margins;
  dynamic takeProfit;

  RobotSettingsModel(
      {this.trader,
      this.myCost,
      this.leverage,
      this.noOfCycles,
      this.marginCallLimit,
      this.totalCost,
      this.margins,
      this.takeProfit});

  RobotSettingsModel.fromJson(Map<String, dynamic> json) {
    trader = json['trader'] ?? '0';
    myCost = json['myCost'] ?? '0';
    leverage = json['leverage']  ?? '0';
    noOfCycles = json['no_of_cycles'] ?? '0';
    marginCallLimit = json['marginCallLimit'] ?? '0';
    totalCost = json['total_cost'] ?? '0';
    if (json['margins'] != null) {
      margins = <Margins>[];
      json['margins'].forEach((v) {
        margins!.add(Margins.fromJson(v));
      });
    }
    takeProfit = json['takeProfit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['trader'] = this.trader;
    data['myCost'] = this.myCost;
    data['leverage'] = this.leverage;
    data['no_of_cycles'] = this.noOfCycles;
    data['marginCallLimit'] = this.marginCallLimit;
    data['total_cost'] = this.totalCost;
    if (this.margins != null) {
      data['margins'] = this.margins!.map((v) => v.toJson()).toList();
    }
    data['takeProfit'] = this.takeProfit;
    return data;
  }
}

class Margins {
  String? percent;
  String? times;

  Margins({this.percent, this.times});

  Margins.fromJson(Map<String, dynamic> json) {
    percent = json['percent'];
    times = json['times'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['percent'] = this.percent;
    data['times'] = this.times;
    return data;
  }
}

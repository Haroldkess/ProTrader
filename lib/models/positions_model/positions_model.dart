class TradePositions {
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

  TradePositions(
    {
      this.id,
      this.positionId,
        this.userId,
  this.symbol,
  this.side,
  this.mode,
  this.leverage,
  this.size,
  this.firstPrice,
  this.startPrice,
  this.endPrice,
  this.nextMcost,
  this.nextMprice,
  this.liquidation,
  this.targetProfit,
  this.closeBy,
  this.trader,
  this.status,
  this.cycle,
  this.margin,
  this.pnl,
  this.roe,
  this.changes,
  this.pnlStatus,
  this.robotSettings,
  this.createdAt,
  this.updatedAt,
    }
  );

  TradePositions.fromJson(Map<String, dynamic> json) {
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
  }
}

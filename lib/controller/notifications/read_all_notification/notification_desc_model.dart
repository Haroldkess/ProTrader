// To parse this JSON data, do
//
//     final notificationDescModel = notificationDescModelFromJson(jsonString);

import 'dart:convert';

NotificationDescModel notificationDescModelFromJson(String str) => NotificationDescModel.fromJson(json.decode(str));

String notificationDescModelToJson(NotificationDescModel data) => json.encode(data.toJson());

class NotificationDescModel {
    NotificationDescModel({
        this.status,
        this.data,
    });

    bool? status;
    List<Datum>? data;

    factory NotificationDescModel.fromJson(Map<String, dynamic> json) => NotificationDescModel(
        status: json["status"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
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
        this.stopLoss,
    });

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
    dynamic closeBy;
    String? trader;
    String? status;
    String? cycle;
    String? margin;
    String? pnl;
    String? roe;
    String? changes;
    dynamic pnlStatus;
    Map<String, dynamic>? robotSettings;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic stopLoss;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        positionId: json["position_id"],
        userId: json["user_id"],
        symbol: json["symbol"],
        side: json["side"],
        mode: json["mode"],
        leverage: json["leverage"],
        size: json["size"],
        firstPrice: json["first_price"],
        startPrice: json["start_price"],
        endPrice: json["end_price"],
        nextMcost: json["next_mcost"],
        nextMprice: json["next_mprice"],
        liquidation: json["liquidation"],
        targetProfit: json["target_profit"],
        closeBy: json["close_by"],
        trader: json["trader"],
        status: json["status"],
        cycle: json["cycle"],
        margin: json["margin"],
        pnl: json["pnl"],
        roe: json["roe"],
        changes: json["changes"],
        pnlStatus: json["pnl_status"],
        robotSettings: json["robot_settings"],
      //  robotSettings: json["robot_settings"] == null ? null : RobotSettings.fromJson(json["robot_settings"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        stopLoss: json["stop_loss"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "position_id": positionId,
        "user_id": userId,
        "symbol": symbol,
        "side": side,
        "mode": mode,
        "leverage": leverage,
        "size": size,
        "first_price": firstPrice,
        "start_price": startPrice,
        "end_price": endPrice,
        "next_mcost": nextMcost,
        "next_mprice": nextMprice,
        "liquidation": liquidation,
        "target_profit": targetProfit,
        "close_by": closeBy,
        "trader": trader,
        "status": status,
        "cycle": cycle,
        "margin": margin,
        "pnl": pnl,
        "roe": roe,
        "changes": changes,
        "pnl_status": pnlStatus,
       // "robot_settings": robotSettings,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "stop_loss": stopLoss,
    };
}

class RobotSettings {
    RobotSettings({
        this.margins,
        this.cycles,
        this.noOfCycles,
        this.marginCallLimit,
        this.trader,
        this.myCost,
        this.leverage,
        this.takeProfit,
        this.totalCost,
        this.stopLossPercentage,
    });

    List<dynamic>? margins;
    List<dynamic>? cycles;
    int? noOfCycles;
    int? marginCallLimit;
    String? trader;
    int? myCost;
    int? leverage;
    int? takeProfit;
    int? totalCost;
    int? stopLossPercentage;

    factory RobotSettings.fromJson(Map<String, dynamic> json) => RobotSettings(
        margins: json["margins"] == null ? [] : List<dynamic>.from(json["margins"]!.map((x) => x)),
        cycles: json["cycles"] == null ? [] : List<dynamic>.from(json["cycles"]!.map((x) => x)),
        noOfCycles: json["no_of_cycles"],
        marginCallLimit: json["marginCallLimit"],
        trader: json["trader"],
        myCost: json["myCost"],
        leverage: json["leverage"],
        takeProfit: json["takeProfit"],
        totalCost: json["total_cost"],
        stopLossPercentage: json["stopLossPercentage"],
    );

    Map<String, dynamic> toJson() => {
        "margins": margins == null ? [] : List<dynamic>.from(margins!.map((x) => x)),
        "cycles": cycles == null ? [] : List<dynamic>.from(cycles!.map((x) => x)),
        "no_of_cycles": noOfCycles,
        "marginCallLimit": marginCallLimit,
        "trader": trader,
        "myCost": myCost,
        "leverage": leverage,
        "takeProfit": takeProfit,
        "total_cost": totalCost,
        "stopLossPercentage": stopLossPercentage,
    };
}

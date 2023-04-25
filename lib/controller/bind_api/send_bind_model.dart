// To parse this JSON data, do
//
//     final sendBindKey = sendBindKeyFromJson(jsonString);

import 'dart:convert';

SendBindKey sendBindKeyFromJson(String str) => SendBindKey.fromJson(json.decode(str));

String sendBindKeyToJson(SendBindKey data) => json.encode(data.toJson());

class SendBindKey {
    SendBindKey({
        this.id,
        this.exchanges,
    });

    String? id;
    Exchanges? exchanges;

    factory SendBindKey.fromJson(Map<String, dynamic> json) => SendBindKey(
        id: json["id"],
        exchanges: json["exchanges"] == null ? null : Exchanges.fromJson(json["exchanges"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "exchanges": exchanges?.toJson(),
    };
}

class Exchanges {
    Exchanges({
        this.bianance,
    });

    Bianance? bianance;

    factory Exchanges.fromJson(Map<String, dynamic> json) => Exchanges(
        bianance: json["bianance"] == null ? null : Bianance.fromJson(json["bianance"]),
    );

    Map<String, dynamic> toJson() => {
        "bianance": bianance?.toJson(),
    };
}

class Bianance {
    Bianance({
        this.apiPrivateKey,
        this.apiPublicKey,
    });

    String? apiPrivateKey;
    String? apiPublicKey;

    factory Bianance.fromJson(Map<String, dynamic> json) => Bianance(
        apiPrivateKey: json["api_private_key"],
        apiPublicKey: json["api_public_key"],
    );

    Map<String, dynamic> toJson() => {
        "api_private_key": apiPrivateKey,
        "api_public_key": apiPublicKey,
    };
}

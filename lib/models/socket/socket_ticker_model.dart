class SocketTicker {
  String? e;
  int? E;
  String? s;
  String? c;
  String? o;
  String? h;
  String? l;
  String? v;
  String? q;

  SocketTicker();

  SocketTicker.fromJson(Map<String, dynamic> json) {
    e = json['e'];
    e = json['E'];
    s = json['s'];
    c = json['c'];
    o = json['o'];
    h = json['h'];
    l = json['l'];
    v = json['v'];
    q = json['q'];
  }
}

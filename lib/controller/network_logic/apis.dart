class API {
  static const String BASE_URL = "httpS://api.bizzatrader.com/";
}

class NetworkConstants {
  //Authentication
  static const String login = "core/auth/login";
  static const String register = "core/auth/register";
  static const String sendResetLink = "core/auth/send/resetlink";
  static const String resetPassword = "core/auth/reset/password";
  static const String user = "user";

  //Trades

  static const String createOrders = "crypto/create-order";
  static const String getPositions = "crypto/get-positions";

  static String getSinglePositions(String? id) =>
      "crypto/get-single-position?position_id=$id";
  static const String dashboardData = "crypto/dashboard-stats";
  static const String topTraders = "crypto/top-traders";
  static const String topCoins = "crypto/top-coins";
  static const String getOrders = "crypto/get-orders";
  static const String earnings = "crypto/earnings";
  static const String topTrades = "crypto/top-trades";
  
  //2fa
   static const String verifyTwoFa = "core/2fa/verify";
   static const String resetTwoFa = "core/2fa/enable";

  //Robot Settings
  static const String stopMargin = "crypto/stop-margin";
  static const String killBot = "crypto/kill-trade-bot";
  static String getSingleTicker(String? symbol) =>
      "crypto/get-single-market-sticker/$symbol";
  static const String changeCycle = "crypto/change-cycle";
  static const String saveRobotSettings = "crypto/update-robot-setting";
  static const String closePostions = "crypto/close-positions";
  static const String addMargin = "crypto/add-avg-margin";
  static String getRobotSettings(String? id) => "crypto/get-robot-setting/$id";

  static String getNewAddress = "crypto/get-new-address";
  static String changeMode = "core/profile/switch-mode";
  static String updateBalance = "update-balance";
  static String notifications = "crypto/notification";
  static String markAsRead(String? id) => "crypto/notification/read/$id";

  static String webSocket(String? symbol) =>
      "wss://stream.binance.com:9443/ws/$symbol@miniTicker";
}

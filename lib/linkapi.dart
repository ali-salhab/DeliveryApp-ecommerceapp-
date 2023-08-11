class Applink {
  static const String server =
      "https://alisalhab.000webhostapp.com/ecommerceapp_backend";

  // ----------------------home-----------
  static const String deliveryserver = "$server/delivery";

  //----------------------images----------------------
  static const String serverimage =
      "https://alisalhab.000webhostapp.com/ecommerceapp_backend";

  static const String categories = "$serverimage/upload/categories";
  static const String items = "$serverimage/upload/items";

// categories
  static const String viewpending = "$deliveryserver/order/pending.php";
  static const String viewarchieved = "$deliveryserver/order/archieve.php";

  static const String viewaccepted = "$deliveryserver/order/accepted.php";
  static const String done = "$deliveryserver/order/done.php";
  static const String approve = "$deliveryserver/order/approve.php";
  static const String login = "$deliveryserver/auth/login.php";
}

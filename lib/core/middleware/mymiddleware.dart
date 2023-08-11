import 'package:deliveryapp/core/constants/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/services.dart';

class MyMiddleware extends GetMiddleware {
  @override
  //the most important now
  int? get priority => 1;
  @override
  MyServices serv = Get.find();
  RouteSettings? redirect(String? route) {
    print("rooootee ${serv.shared.getString("step")}");
    if (serv.shared.getString('step') == '2') {
      return const RouteSettings(name: AppRoutes.homepage);
    }
    if (serv.shared.getString('step') == '1') {
      return const RouteSettings(name: AppRoutes.login);
    }
  }
}

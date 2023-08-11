import 'package:deliveryapp/core/class/statusrequest.dart';
import 'package:deliveryapp/core/functions/handlingdata.dart';
import 'package:deliveryapp/core/services/services.dart';
import 'package:deliveryapp/data/datasource/remote/orderdata.dart';
import 'package:deliveryapp/view/screens/acceptedorders.dart';
import 'package:deliveryapp/view/screens/pendingorders.dart';
import 'package:get/get.dart';

class HomePagecontroller extends GetxController {
  int selectedpage = 0;

  List pages = [PendingOrder(), AcceptedOrder()];

  List pendingdata = [];
  List accepteddata = [];
  Statusrequest statusrequest = Statusrequest.none;
  OrderData orderdata = OrderData(Get.find());
  MyServices ser = Get.find();
  getpendingorders() async {
    statusrequest = Statusrequest.loading;
    update();
    var response =
        await orderdata.getpendingorders(ser.shared.getString("id")!);

    statusrequest = handlingdata(response);

    if (statusrequest == Statusrequest.success) {
      if (response['status'] == 'success') {
        pendingdata = response['data'];
      } else {
        statusrequest = Statusrequest.failure;
        update();
      }
    }
    update();
  }

  getacceptedorders() async {
    statusrequest = Statusrequest.loading;
    update();
    var response =
        await orderdata.getacceptedorders(ser.shared.getString("id")!);

    statusrequest = handlingdata(response);

    if (statusrequest == Statusrequest.success) {
      if (response['status'] == 'success') {
        accepteddata = response['data'];
      } else {
        statusrequest = Statusrequest.failure;
        update();
      }
    }
    update();
  }

  @override
  void onInit() {
    getacceptedorders();
    getpendingorders();
    // TODO: implement onInit
    super.onInit();
  }
}

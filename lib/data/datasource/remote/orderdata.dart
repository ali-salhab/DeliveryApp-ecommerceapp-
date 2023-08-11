import 'package:deliveryapp/core/class/crud.dart';
import 'package:deliveryapp/linkapi.dart';
import 'package:get/get.dart';

class OrderData {
  Crud crud = Get.find();
  OrderData(this.crud);
  getpendingorders(String id) async {
    var response = await crud.postdata(Applink.viewpending, {"id": id});

    // print(response);
    return response.fold((l) => l, (r) => r);
  }

  getacceptedorders(String id) async {
    var response = await crud.postdata(Applink.viewaccepted, {"id": id});

    // print(response);
    return response.fold((l) => l, (r) => r);
  }

  getarchievedorders(String id) async {
    var response = await crud.postdata(Applink.viewaccepted, {"id": id});

    // print(response);
    return response.fold((l) => l, (r) => r);
  }

  done(String userid, String orderid, String deliveryid) async {
    var response = await crud.postdata(Applink.done, {
      "userid": userid,
      "orderid": orderid,
      "deliveryid": deliveryid,
    });

    // print(response);
    return response.fold((l) => l, (r) => r);
  }

  appove(String userid, String orderid, String deliveryid) async {
    var response = await crud.postdata(Applink.approve, {
      "userid": userid,
      "orderid": orderid,
      "deliveryid": deliveryid,
    });

    // print(response);
    return response.fold((l) => l, (r) => r);
  }
}

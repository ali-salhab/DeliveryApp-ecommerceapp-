import 'package:deliveryapp/core/class/crud.dart';
import 'package:deliveryapp/linkapi.dart';
import 'package:get/get.dart';

class LoginData {
  Crud crud = Get.find();
  LoginData(this.crud);
  login(String email, String password) async {
    var response = await crud
        .postdata(Applink.viewpending, {"email": email, "password": password});

    // print(response);
    return response.fold((l) => l, (r) => r);
  }
}

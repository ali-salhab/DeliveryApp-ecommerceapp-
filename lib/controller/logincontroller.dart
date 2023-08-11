import 'package:deliveryapp/core/constants/colors.dart';
import 'package:deliveryapp/core/services/services.dart';
import 'package:deliveryapp/data/datasource/remote/logindata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdata.dart';

class LoginController extends GetxController {
  late TextEditingController email;
  bool passwordstatus = true;
  late TextEditingController password;
  Statusrequest statusrequest = Statusrequest.none;
  GlobalKey<FormState> formstatelogin = GlobalKey<FormState>();
  LoginData logindata = LoginData(Get.find());
  List data = [];
  MyServices myServices = Get.find();
  @override
  login() async {
    // print("login");
    // print(email.text);
    if (formstatelogin.currentState!.validate()) {
      statusrequest = Statusrequest.loading;
      update();
      var response = await logindata.login(
          email.text.toString(), password.text.toString());

      statusrequest = handlingdata(response);

      if (statusrequest == Statusrequest.success) {
        if (response['status'] == 'success') {
          myServices.shared.setString('id', response['data']['user_id']);
          myServices.shared.setString('email', response['data']['user_email']);

          myServices.shared.setString('step', '2');
          FirebaseMessaging.instance.subscribeToTopic("delivery");

          FirebaseMessaging.instance
              .subscribeToTopic("delivery${response['data']['user_id']}");
        } else {
          Get.defaultDialog(
              backgroundColor: AppColors.primarycolor,
              title: "Error ",
              middleTextStyle: TextStyle(color: Colors.white, fontSize: 15),
              titleStyle: TextStyle(color: Colors.white, fontSize: 25),
              middleText:
                  "email or password not valid ,Dont have Account try to signup");
          //here every thing ok but no data where pounded
          // statusrequest = Statusrequest.failure;
        }
      }

      update();
    } else {
      print('not valid');
    }
  }

  @override
  void onInit() {
    email = TextEditingController();

    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  showpassword() {
    passwordstatus = !passwordstatus;
    update();
  }
}

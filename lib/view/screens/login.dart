import 'package:deliveryapp/controller/logincontroller.dart';
import 'package:deliveryapp/core/class/handlingdataview.dart';
import 'package:deliveryapp/core/constants/colors.dart';
import 'package:deliveryapp/view/widget/customtextformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/functions/alertexitapp.dart';
import '../../../core/functions/validinput.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          title: Text(
            'Login Page',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: AppColors.black, fontFamily: 'playfair'),
          ),
        ),
        body: WillPopScope(
          onWillPop: alertexitpp,
          child: GetBuilder<LoginController>(
            builder: (controller) => Handlingdataview(
                statusrequest: controller.statusrequest,
                widget: Container(
                  child: WillPopScope(
                      onWillPop: alertexitpp,
                      child: Container(
                        margin: EdgeInsets.all(35),
                        child: Form(
                          key: controller.formstatelogin,
                          child: ListView(
                            children: [
                              // const LogoAuth(),
                              Text(
                                'Welcome Back',
                                textAlign: TextAlign.center,
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              CustomTextFormField(
                                isnumeric: false,
                                valid: (val) {
                                  print(val);
                                  return validate(
                                      val.toString(), 10, 100, 'email');
                                },
                                hint: 'Enter Your Email',
                                icon: Icons.email_outlined,
                                label: 'Email',
                                mycontroller: controller.email,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              GetBuilder<LoginController>(
                                builder: (context) => CustomTextFormField(
                                  isnumeric: false,
                                  ontap: () {
                                    print('icon tapped');
                                    controller.showpassword();
                                  },
                                  ispasswordfield: true,
                                  valid: (val) {
                                    return validate(
                                        val.toString(), 5, 100, 'password');
                                  },
                                  hint: 'Enter Youe Password',
                                  icon: controller.passwordstatus
                                      ? Icons.lock_outlined
                                      : Icons.no_encryption_outlined,
                                  label: 'password',
                                  mycontroller: controller.password,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                )),
          ),
        ));
  }
}

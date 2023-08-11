import 'package:deliveryapp/controller/homepagecontroller.dart';
import 'package:deliveryapp/core/class/handlingdataview.dart';
import 'package:deliveryapp/core/constants/colors.dart';
import 'package:deliveryapp/core/functions/handlingdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    HomePagecontroller controller = Get.put(HomePagecontroller());
    return Scaffold(
      bottomNavigationBar: GetBuilder<HomePagecontroller>(
        builder: (controller) => BottomNavigationBar(
            selectedItemColor: AppColors.primarycolor,
            onTap: (val) {
              controller.selectedpage = val;
              print(val);
              controller.update();
            },
            items: const [
              BottomNavigationBarItem(
                  label: "Waiting orders",
                  icon: Icon(
                    Icons.cloud_circle,
                  )),
              BottomNavigationBarItem(
                  label: "accepted orders",
                  icon: Icon(
                    Icons.trending_up,
                  ))
            ]),
      ),
      appBar: AppBar(
        title: Text("Delivery"),
      ),
      body: GetBuilder<HomePagecontroller>(
          builder: (controller) => Handlingdataview(
              statusrequest: controller.statusrequest,
              widget: controller.pages[controller.selectedpage])),
    );
  }
}

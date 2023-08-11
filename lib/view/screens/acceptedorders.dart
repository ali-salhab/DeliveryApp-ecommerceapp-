import 'package:deliveryapp/controller/homepagecontroller.dart';
import 'package:deliveryapp/core/class/handlingdataview.dart';
import 'package:deliveryapp/view/widget/cardorder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AcceptedOrder extends StatelessWidget {
  const AcceptedOrder({super.key});

  @override
  Widget build(BuildContext context) {
    HomePagecontroller controller = Get.put(HomePagecontroller());
    return GetBuilder<HomePagecontroller>(builder: (controller) {
      return Handlingdataview(
          statusrequest: controller.statusrequest,
          widget: ListView.builder(
              itemCount: controller.accepteddata.length,
              itemBuilder: (context, index) {
                return Cardorder(
                  buttontext: "prepared",
                  carttype: '',
                  orderid: controller.accepteddata[index]['order_id'],
                  ontapaccept: () {
                    // controller.doneprepare(
                    //     controller.accepteddata[index]['order_id'],
                    //     controller.accepteddata[index]['order_userid'],
                    //     controller.accepteddata[index]['order_type']);
                  },
                  ontaprating: () {},
                  data: {},
                  ordertype: controller.accepteddata[index]['order_type'],
                  orderprice: controller.accepteddata[index]['order_price'],
                  deliveryprice: controller.accepteddata[index]
                      ['order_shippingprice'],
                  paymentmethod: controller.accepteddata[index]
                      ['order_paymentmethod'],
                  ordernumber: controller.accepteddata[index]['order_id'],
                  totalprice: controller.accepteddata[index]
                      ['order_totalprice'],
                  orderstatus: controller.accepteddata[index]['order_status'],
                  date: controller.accepteddata[index]['order_datetime'],
                );
              }));
    });
  }
}

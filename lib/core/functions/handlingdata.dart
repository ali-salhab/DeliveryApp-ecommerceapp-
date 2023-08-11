import 'package:deliveryapp/core/class/statusrequest.dart';

handlingdata(response) {
  if (response is Statusrequest) {
    return response;
//failurre
  } else {
    return Statusrequest.success;
  }
}

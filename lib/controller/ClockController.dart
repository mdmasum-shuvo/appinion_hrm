import 'package:appinion_hrm/model/clock/clock_response.dart';
import 'package:appinion_hrm/repository/ClockIn.dart';
import 'package:get/get.dart';

class ClockController extends GetxController {
  var isLoading = false.obs;
  var clockInResponse = ClockResponse().obs;

  void clockIn() async {
    try {
      isLoading(true);
      var response = await ClockInRepository.clockInRequest();
      if (response != null) {
        clockInResponse.value = response;
        Get.snackbar("Success",response.message.toString(),snackPosition: SnackPosition.BOTTOM);

      }{
        Get.snackbar("error","Something went wrong",snackPosition: SnackPosition.BOTTOM);

      }
    }

    finally {
      isLoading(false);
    }
  }
}

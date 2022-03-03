import 'package:appinion_hrm/model/clock/clock_response.dart';
import 'package:appinion_hrm/model/home/DashBoardResponse.dart';
import 'package:appinion_hrm/repository/ClockIn.dart';
import 'package:appinion_hrm/repository/DashboardRepository.dart';
import 'package:get/get.dart';

class ClockController extends GetxController {
  var isLoading = false.obs;
  var clockInResponse = ClockResponse().obs;
  var dashboardResponse = DashBoardResponse().obs;
  var clockInTime = "you haven't clock in yet".obs;
  var clockText = "Clock In".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    clockInInfo();
    requestDashboard();
  }

  void clockIn() async {

    try {
      isLoading(true);
      var response = await ClockInRepository.clockInRequest();
      if (response != null) {
       // clockInResponse.value = response;
        if(response.data !=null){
          clockInTime.value=response.data!.clockIn!;
          clockText.value="Clock Out";
        }
        else{
          clockInTime.value=response.message!;
          clockInInfo();
        }
        Get.snackbar("Success",response.message.toString(),snackPosition: SnackPosition.BOTTOM);
      }
      else
      {
        Get.snackbar("error","Something went wrong",snackPosition: SnackPosition.BOTTOM);

      }
    }

    finally {
      isLoading(false);
    }
  }
  void clockOut() async {
    try {
      isLoading(true);
      var response = await ClockInRepository.clockOutRequest();
      if (response != null) {
       // clockInResponse.value = response;
        if(response.data !=null){
          clockInTime.value=response.data!.clockIn!;
          clockText.value="Clock Out";
        }
        else{
          clockInTime.value=response.message!;
          clockInInfo();
        }
        Get.snackbar("Success",response.message.toString(),snackPosition: SnackPosition.BOTTOM);
      }
      else
      {
        Get.snackbar("error","Something went wrong",snackPosition: SnackPosition.BOTTOM);

      }
    }

    finally {
      isLoading(false);
    }
  }

  void clockInInfo() async {
    try {
      isLoading(true);
      var response = await ClockInRepository.clockInfo();
      if (response != null) {
       // clockInResponse.value = response;
        if(response.data!.clockOut!=null){
          clockInTime.value="Clocked out Time :" +response.data!.clockOut!;
          clockText.value="Clock out";
        }
        else if(response.data!.clockIn!=null){
          clockInTime.value=response.data!.clockIn!;
          clockText.value="Clock out";

        }
      }
      else
      {
        Get.snackbar("error","Something went wrong",snackPosition: SnackPosition.BOTTOM);
      }
    }

    finally {
      isLoading(false);
    }
  }
  void requestDashboard() async {
    try {
      isLoading(true);
      var response = await DashboardRepository.dashboardRequest();
      if (response != null) {
        dashboardResponse.value=response;
      }
      else
      {
        Get.snackbar("error","Something went wrong",snackPosition: SnackPosition.BOTTOM);
      }
    }

    finally {
      isLoading(false);
    }
  }
}

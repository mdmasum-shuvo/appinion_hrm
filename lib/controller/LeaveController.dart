import 'package:appinion_hrm/model/leave/LeaveData.dart';
import 'package:appinion_hrm/model/leave/LeavePost.dart';
import 'package:appinion_hrm/repository/LeaveRepository.dart';
import 'package:appinion_hrm/screen/Home/data/DashboardData.dart';
import 'package:appinion_hrm/theme/Colors.dart';
import 'package:get/get.dart';

class LeaveController extends GetxController {
  var isLoading = false.obs;
  var message = "".obs;
  var leaveDashBoardData = LeaveData().obs;
  final list = <LeaveDashBoardData>[].obs;

  @override
  void onInit() {
    super.onInit();
    callLeaveDashBoardData();
  }

  void requestApplyLeave(LeavePost post) async {
    try {
      isLoading(true);
      var response = await LeaveRepository.applyLeave(post);
      if (response != null) {
        message.value = response.message!;

        Get.snackbar("Success", response.message.toString(),
            snackPosition: SnackPosition.BOTTOM);
      } else {
        Get.snackbar("Error", "something went wrong!",
            snackPosition: SnackPosition.BOTTOM);
        message.value = "something went wrong!";
      }
    } finally {
      isLoading(false);
    }
  }

  void callLeaveDashBoardData() async {
    try {
      isLoading(true);
      var response = await LeaveRepository.leaveInfo();
      if (response != null) {
        leaveDashBoardData.value = response;
        Get.snackbar("Success", "Successfully load data",
            snackPosition: SnackPosition.BOTTOM);
        list.add(
          LeaveDashBoardData(
              id: 0,
              title: "Casual Leave",
              subTitle: "Leave Remain",
              actualData: int.parse(response.casualLeave!),
              remainData:
                  int.parse(response.casualLeave!) - response.casualLeaveUse!,
              color: green),
        );

        list.add(
          LeaveDashBoardData(
              id: 0,
              title: "Casual Leave",
              subTitle: "Leave Remain",
              actualData: int.parse(response.sickLeaveAssign!),
              remainData: int.parse(response.sickLeaveAssign!) -
                  response.sickLeaveUse!,
              color: yellow),
        );
      } else {
        Get.snackbar("Error", "something went wrong!",
            snackPosition: SnackPosition.BOTTOM);
        message.value = "something went wrong!";
      }
    } finally {
      isLoading(false);
    }
  }
}

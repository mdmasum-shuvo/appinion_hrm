import 'package:appinion_hrm/model/user/user.dart';
import 'package:appinion_hrm/repository/UserRepository.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static String token = "";
  static bool isLogin = false;
  var message = "".obs;
  final name = "".obs;
  final photo = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    requestUser();
  }

  void requestUser() async {
    try {
      var response = await UserRepository.userData();
      if (response != null) {
        name.value = response.user!.name!;
        photo.value = response.user!.photo!;
      } else {
        Get.snackbar("Error", "something went wrong!",
            snackPosition: SnackPosition.BOTTOM);
        message.value = "something went wrong!";
      }
    } finally {}
  }
}

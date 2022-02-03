
import 'package:appinion_hrm/model/login_response.dart';
import 'package:appinion_hrm/repository/AuthRepository.dart';
import 'package:appinion_hrm/screen/Home/HomeScreen.dart';
import 'package:appinion_hrm/theme/constants.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  var isSuccess = false.obs;

  var casts = LoginResponse().obs;
  var error = "".obs;

  void authLogin(String userID, String pass) async {
    final prefs = await SharedPreferences.getInstance();

    try {
      isLoading(true);
      var response = await AuthRepository.loginPost(userID, pass);
      if (response != null) {
        casts.value = response;
        prefs.setString(PREF_TOKEN, casts.value.token.toString());
        isSuccess.value = true;
        Get.to(HomeScreen(),transition: Transition.rightToLeft,duration: Duration(seconds: 2));
      } else {
        Get.snackbar("Error", "user id or password is invalid",snackPosition: SnackPosition.BOTTOM);
      }
    } finally {
      isLoading(false);
    }
  }
}

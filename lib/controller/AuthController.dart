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
  static String token = "";
  static bool isLogin = false;

  var casts = LoginResponse().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    sharedFunc();

  }

  static sharedFunc() async {
    final pref = await SharedPreferences.getInstance();
    isLogin = pref.getBool(IS_LOGIN) ?? false;
    if (isLogin) {
      Get.offAll(HomeScreen());
    }
  }

  var error = "".obs;

  void authLogin(String userID, String pass) async {
    final prefs = await SharedPreferences.getInstance();

    try {
      isLoading(true);
      var response = await AuthRepository.loginPost(userID, pass);
      if (response != null) {
        isLoading(false);
        casts.value = response;
        prefs.setString(PREF_TOKEN, casts.value.token.toString());
        prefs.setBool(IS_LOGIN, true);
        //token = casts.value.token.toString();
        isSuccess.value = true;
        //Get.to(HomeScreen());
        Get.offAll(HomeScreen());
      } else {
        Get.snackbar("Error", "user id or password is invalid",
            snackPosition: SnackPosition.BOTTOM);
      }
    } finally {
      isLoading(false);
    }
  }
}

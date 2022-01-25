import 'package:appinion_hrm/model/login_response.dart';
import 'package:appinion_hrm/repository/AuthRepository.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';

class AuthController extends GetxController {
  var isLoading = true.obs;

  var data = LoginResponse().obs;

  void authLogin(String userID, String pass) async {
    try {
      isLoading(true).obs;
      var response = await AuthRepository.loginPost(userID, pass);
      if (response != null) {}
    } finally {
      isLoading(false);
    }
  }
}

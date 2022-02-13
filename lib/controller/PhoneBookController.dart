
import 'package:appinion_hrm/model/phone_book.dart';
import 'package:appinion_hrm/repository/PhoneBookRepository.dart';
import 'package:get/get.dart';

class PhoneBookController extends GetxController{
  var isLoading = false.obs;
  var message = "".obs;
  final list = <PhoneBook>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    requestPhoneBook();
  }


  void requestPhoneBook() async {
    try {
      isLoading(true);
      var response = await PhoneBookRepository.phoneBookData();
      if (response != null) {
        list.value=response;
        Get.snackbar("Success", "Data loaded successfully",
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
}
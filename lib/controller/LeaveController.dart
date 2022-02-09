
import 'package:appinion_hrm/model/DefaultResponse.dart';
import 'package:appinion_hrm/model/leave/LeavePost.dart';
import 'package:appinion_hrm/repository/LeaveRepository.dart';
import 'package:get/get.dart';

 class LeaveController extends GetxController{
  var isLoading = false.obs;
  var message = "".obs;

  void requestApplyLeave(LeavePost post) async{

   try{
    isLoading(true);
    var response=await LeaveRepository.applyLeave(post);
    if(response !=null){
     message.value=response.message!;
     Get.snackbar("Success",response.message.toString(),snackPosition: SnackPosition.BOTTOM);

    }
    else{
     Get.snackbar("Error","something went wrong!",snackPosition: SnackPosition.BOTTOM);
     message.value="something went wrong!";
    }

   }

   finally{
    isLoading(false);
   }


  }

 }
import 'package:crafty_bay/data/serves/network_caller.dart';
import 'package:crafty_bay/presentation/state_holders/read_profile_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/utitlty/urls.dart';
import 'package:get/get.dart';

class VerifyOTPController extends GetxController {
  bool _isProgress = false;
  bool get isProgress => _isProgress;
  String _errorMassage = "";
  String get errormassage => _errorMassage;
  bool _shouldNavigateCompleteProfile = true;
  bool get shouldNavigateCompleteProfile => _shouldNavigateCompleteProfile;
  Future<bool> verifyOTP(String email, String otp) async {
    _isProgress = true;
    update();
    final response =
        await NetaorkCaller().getRequest(Urls.verifyOtp(email, otp));
    _isProgress = false;
    update();
    if (response.isSucass) {
      final token = response.responseData["data"];
      Future.delayed(const Duration(seconds: 5));
      print(token);
      final result =
          await Get.find<ReadProfileDataController>().readProfileData(token);
      if (result) {
        _shouldNavigateCompleteProfile =
            Get.find<ReadProfileDataController>().isPrefileCompled == false;
      } else {
        _errorMassage = Get.find<ReadProfileDataController>().errormassage;

        update();
        return false;
      }

      // ToDo : save to locol cashe
      // condition: if user profile completed then sove existing info
      //Othernise complete profile and than save info
      return true;
    } else {
      _errorMassage = response.errorMessage;
      update();
      return false;
    }
  }
}

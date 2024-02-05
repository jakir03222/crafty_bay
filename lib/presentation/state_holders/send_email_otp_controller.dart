import 'package:crafty_bay/data/response_data.dart';
import 'package:crafty_bay/data/serves/network_caller.dart';
import 'package:crafty_bay/presentation/ui/screens/utitlty/urls.dart';
import 'package:get/get.dart';

class SendEmailOtpController extends GetxController {
  bool _inProggress = false;
  bool get inProgress => _inProggress;
  String _errorMessage = "";
  String get errorMessage => _errorMessage;
  Future<bool> sendOtpEmail(String email) async {
    _inProggress = false;
    update();
    final ResponseData respons =
        await NetaorkCaller().getRequest(Urls.sentEmailOtp(email));
    _inProggress = false;

    if (respons.isSucass) {
      update();
      return true;
    } else {
      _errorMessage = respons.errorMessage;
      update();
      return false;
    }
  }
}

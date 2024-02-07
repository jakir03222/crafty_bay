import 'package:crafty_bay/data/data_models/profile.dart';
import 'package:crafty_bay/presentation/ui/screens/utitlty/urls.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../../data/serves/network_caller.dart';

class ReadProfileDataController extends GetxController {
  bool _isProgress = false;
  bool get isProgress => _isProgress;
  String _errorMassage = "";
  String get errormassage => _errorMassage;
  Profile _profile = Profile();
  Profile get profile => _profile;
  bool _isPrefileCompleted = false;
  bool get isPrefileCompled => _isPrefileCompleted;
  Future<bool> readProfileData(String token) async {
    _isProgress = true;
    update();
    final response =
        await NetaorkCaller().getRequest(Urls.readProfile, token: token);
    _isProgress = false;
    update();
    if (response.isSucass) {
      final profileData = response.responseData["data"];
      if (profileData == null) {
        _isPrefileCompleted = false;
      } else {
        _profile = Profile.fromJson(profileData[0]);
        _isPrefileCompleted = true;
      }
      // ToDo : save to locol cashe
      update();
      return true;
    } else {
      _errorMassage = response.errorMessage;
      update();
      return false;
    }
  }
}

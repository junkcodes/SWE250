import 'package:swe250/model/signup.dart';

import '../model/login.dart';
import '../model/profile.dart';

class profileController {
  profileModel profilemodel = profileModel();
  var user;

  Future<void> getUser(int userid) async {
    await profilemodel.getuser(userid);
    if(profilemodel.result.numOfRows == 1){
      user = profilemodel.result;
    }
  }
  Future<bool> updateUser(Map<String, dynamic> formData) async {
    profilemodel.formUserData = formData;
    await profilemodel.updateuser();
    if(profilemodel.result != null){
      return true;
    }
    else{
      return false;
    }
  }
}

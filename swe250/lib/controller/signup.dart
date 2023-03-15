import 'package:swe250/model/signup.dart';

class signupController {
  signupModel signupmodel = signupModel();

  Future<bool> doSignup(Map<String, String> formData) async {
    signupmodel.formUserData = formData;
    await signupmodel.signupuser();
    if(signupmodel.result != null){
      return true;
    }
    else{
      return false;
    }
  }
}

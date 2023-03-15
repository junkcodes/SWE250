import 'package:swe250/model/signup.dart';

import '../model/login.dart';

class loginController {
  loginModel loginmodel = loginModel();

  Future<Map<String, dynamic>> doLogin(Map<String, String> formData) async {
    loginmodel.formUserData = formData;
    await loginmodel.loginuser();
    if(loginmodel.result.numOfRows == 1){
      var userid;
      for (final row in loginmodel.result.rows) {
        userid = row.colAt(0);
      }
      return {"res":true, "userid":userid};
    }
    else{
      return {"res":false};
    }
  }
}

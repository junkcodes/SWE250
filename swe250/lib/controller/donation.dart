import 'package:swe250/model/signup.dart';

import '../model/donation.dart';
import '../model/login.dart';

class donationController {
  donationModel donationmodel = donationModel();
  var list,user,searchr;

  Future<bool> addDonation(Map<String, dynamic> formData) async {
    donationmodel.formUserData = formData;
    await donationmodel.adddonation();
    if(donationmodel.result != null){
      return true;
    }
    else{
      return false;
    }
  }
  Future<void> listDonation(String cat) async {
    await donationmodel.listdonation(cat);
    if(donationmodel.result.numOfRows > 0) {
      list = donationmodel.result;
    }
  }
  Future<void> getUser(int userid) async {
    await donationmodel.getuser(userid);
    if(donationmodel.result.numOfRows > 0) {
      user = donationmodel.result;
    }
  }
  Future<void> searchDonation(String search) async {
    await donationmodel.searchdonation(search);
    if(donationmodel.result.numOfRows > 0) {
      searchr = donationmodel.result;
    }
  }
}

import 'package:swe250/model/signup.dart';

import '../model/category.dart';

class categoryController {
  categoryModel categorymodel = categoryModel();
  var list;

  Future<void> listCategory() async {
    await categorymodel.listcategory();
    if(categorymodel.result.numOfRows > 0){
      list = categorymodel.result;
    }
  }
}

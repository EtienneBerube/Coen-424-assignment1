import 'dart:mirrors';

class ProductType{
  static const DVD = "DVD";
  static const NDBENCH = "NDBench";

  static bool exists(String type){
    if(type == DVD || type == NDBENCH )
      return true;
    else
      return false;
  }
}
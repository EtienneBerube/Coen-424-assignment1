class DataType{
  static const JSON = "json";
  static const PROTO = "proto";

  static bool exists(String type){
    if(type == JSON || type == PROTO )
      return true;
    else
      return false;
  }
}
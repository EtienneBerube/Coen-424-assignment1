import 'package:aqueduct/aqueduct.dart';
import 'dart:io';

class DataService{
  static const _metrics = ["CPUUtilization_Average","NetworkIn_Average","NetworkOut_Average","MemoryUtilization_Average","Final_Target"];

  DataService(){
    initialize();
  }


  void initialize(){

  }

  Map getData(Map requestParams){

  }
}
import 'dart:async';
import 'package:aqueduct/aqueduct.dart';
import '../models/data_type.dart';
import '../services/data_service.dart';

class DataController extends Controller{

  final DataService _dataService;

  DataController(this._dataService);


  @override
  FutureOr<RequestOrResponse> handle(Request request) {
    if (request.path.variables.containsKey('type')) {
      final type = request.path.variables['id'];

      if(!DataType.exists(type)){
        return Response.badRequest(body: {"error": "Invalid data scheme [${type}]"});
      }

      if(type == DataType.JSON) {

      }else if(type == DataType.PROTO){

      }

    }
    return Response.badRequest(body: {"error": "Did not find type in request. Send GET to /data/<type>"});
  }

  String encodeProtobuf(Map json){
    return "";
  }

}
import 'dart:async';

import 'package:aqueduct/aqueduct.dart';

class ValidationController extends Controller{
  final _requieredQueryParams=["rfwId","metric","batchUnit","batchId","batchSize"];

  @override
  FutureOr<RequestOrResponse> handle(Request request) {
    if (request.path.variables.containsKey('type') && request.path.variables.containsKey('product')){
      //Get Query variables
      List queries = request.raw.requestedUri.query.split('&').map((s) => s.split('=')[0].trim()).toList();

      bool isValid = _requieredQueryParams.every((value)=> queries.contains(value));
      List<String> missing = _requieredQueryParams.where((value)=> !queries.contains(value)).toList();

      if(isValid) {
        request.attachments = parseQueryParams( request.raw.requestedUri.query);
        return request;
      }else{
        return  Response.badRequest(body: {"error": "Missing Query Params. Requiered: ${_requieredQueryParams}\nMissing: ${missing}"});
      }
    }else{
      return Response.badRequest(body: {"error": "Bad URL, missing params"});
    }
  }

  Map parseQueryParams(String queries){
    return Map.fromIterable(queries.split('&'),key: (query)=> query.split('=')[0].trim(), value: (query){
      String value = query.split('=')[1].trim() as String;
      return int.tryParse(value) ?? value;
    });
  }
}
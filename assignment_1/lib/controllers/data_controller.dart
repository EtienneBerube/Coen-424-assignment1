import 'dart:async';
import 'package:aqueduct/aqueduct.dart';
import '../models/data_type.dart';
import '../services/data_service.dart';
import '../models/protobuffs/proto_out/data_packet.pb.dart';

class DataController extends Controller {
  final DataService _dataService;

  DataController(this._dataService);

  @override
  FutureOr<RequestOrResponse> handle(Request request) {
    final type = request.path.variables['type'];
    final product = request.path.variables['product'];
    Map queries = request.attachments;

    if (!DataType.exists(type)) {
      return Response.badRequest(
          body: {"error": "Invalid data scheme [${type}]"});
    }

    try {
      var data = _dataService.getData(
          product,
          queries["metric"] as String,
          queries["batchUnit"] as int,
          queries["batchId"] as int,
          queries["batchSize"] as int);

      var lastBatchId = ((queries["batchId"] as int) -1) + (queries["batchSize"] as int);

      if (type == DataType.JSON) {
        return Response.ok({
          "rfwId": queries["rfwId"],
          "lastBatchId": lastBatchId,
          "samples": data
        });

      } else if (type == DataType.PROTO) {
        var packet = ReturnPacket();
        packet.rfwId = queries["rfwId"].toString();
        packet.lastBatchId = lastBatchId;
        packet.results.addAll(data);

        var return_packet = packet.writeToBuffer();

        return Response.ok(return_packet,headers: {"Content-Type": "application/octet-stream"});
      }
    } on ValidationException catch (e) {
      return Response.badRequest(body: {"error": "${e.toString()}"});
    }
  }

  String encodeProtobuf(Map json) {
    return "";
  }
}

import 'assignment_1.dart';
import 'controllers/data_controller.dart';
import './services/data_service.dart';

class Assignment1Channel extends ApplicationChannel {
  DataService dataService = DataService();

  @override
  Future prepare() async {
//    CORSPolicy.defaultPolicy.allowedOrigins = ["http://mywebsite.com/"];
    logger.onRecord.listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
  }

  @override
  Controller get entryPoint {
    final router = Router();


    router
        .route("/data/[:type]/[:product]/")
        .link(() => DataController(dataService));

    return router;
  }
}
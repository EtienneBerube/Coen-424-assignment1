import 'assignment_1.dart';
import 'controllers/data_controller.dart';
import './services/data_service.dart';
import 'controllers/validation_controller.dart';

class Assignment1Channel extends ApplicationChannel {
  DataService dataService = DataService();

  @override
  Future prepare() async {
    logger.onRecord.listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
  }

  @override
  Controller get entryPoint {
    final router = Router();


    router
        .route("/data/:product/:type/")
        .link(() => ValidationController())
        .link(() => DataController(dataService));

    router.route("/")
    .linkFunction((request) {
      print(request.attachments.toString());
      print(request.raw.requestedUri.query);
      return Response.ok("working");
    });

    return router;
  }
}
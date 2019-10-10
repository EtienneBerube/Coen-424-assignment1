import 'package:assignment_1/assignment_1.dart';
import 'package:aqueduct_test/aqueduct_test.dart';

export 'package:assignment_1/assignment_1.dart';
export 'package:aqueduct_test/aqueduct_test.dart';
export 'package:test/test.dart';
export 'package:aqueduct/aqueduct.dart';

/// A testing harness for assignment_1.
///
/// A harness for testing an aqueduct application. Example test file:
///
///         void main() {
///           Harness harness = Harness()..install();
///
///           test("GET /path returns 200", () async {
///             final response = await harness.agent.get("/path");
///             expectResponse(response, 200);
///           });
///         }
///
class Harness extends TestHarness<Assignment1Channel> {
  @override
  Future onSetUp() async {

  }

  @override
  Future onTearDown() async {

  }
}

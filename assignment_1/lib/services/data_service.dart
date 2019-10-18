import 'package:aqueduct/aqueduct.dart';
import 'dart:io';
import 'package:csv/csv.dart';
import 'dart:convert';
import 'dart:async';

class DataService {
  static const _metrics = [
    "CPUUtilization_Average",
    "NetworkIn_Average",
    "NetworkOut_Average",
    "MemoryUtilization_Average",
    "Final_Target"
  ];
  List<List<dynamic>> dvd_training;
  List<List<dynamic>> dvd_test;
  List<List<dynamic>> ndbench_training;
  List<List<dynamic>> ndbench_test;

  DataService() {
    initialize();
  }

  void initialize() async {
    print(Directory.current);
    dvd_training = await getFromCSV('DVD-training.csv');
    dvd_test = await getFromCSV('DVD-testing.csv');
    ndbench_test = await getFromCSV('NDBench-testing.csv');
    ndbench_training = await getFromCSV('NDBench-training.csv');
    print(dvd_training.toString() +
        "\n****************************************************************");
    print(dvd_test.toString() +
        "\n****************************************************************");
    print(ndbench_training.toString() +
        "\n****************************************************************");
    print(ndbench_test.toString() +
        "\n****************************************************************");
  }

  Future<List<List>> getFromCSV(String filename) async {
    return await File('lib/resources/${filename}')
        .openRead()
        .transform(utf8.decoder) // Decode bytes to UTF-8.
        .transform(LineSplitter())
        .skip(1) // Convert stream to individual lines.
        .map((String line) {
      // Process results.

      final row =
          line.split(',').map((element) => double.parse(element)).toList();
      return row;
    }).toList();
  }

  List<double> getData(
      String resource, String type, int batchUnit, int batchId, int batchSize) {
    final selection = getDataset(resource, type);

    if (selection == null)
      throw ValidationException(
          ["Cannot find data set for ${resource}-${type}"]);

    final availableBatches = (selection.length / batchUnit) as int;

    if (batchSize > (availableBatches - batchId)) {
      throw ValidationException(
          ["Cannot get ${batchSize}, only have ${availableBatches} available"]);
    }
  }

  List<List<dynamic>> getDataset(String resource, String type) {
    if (resource == 'NDBench') {
      if (type == 'testing') {
        return ndbench_test;
      } else if (type == 'trainig') {
        return ndbench_training;
      }
    } else if (resource == 'DVD') {
      if (type == 'testing') {
        return dvd_test;
      } else if (type == 'training') {
        return dvd_training;
      }
    }
    return null;
  }
}

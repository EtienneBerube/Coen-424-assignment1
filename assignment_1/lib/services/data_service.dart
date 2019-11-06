import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:aqueduct/aqueduct.dart';

class DataService {
  static const _metrics = [
    "cpuutilization_average",
    "networkin_average",
    "networkout_average",
    "memoryutilization_average",
    "final_target"
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
    dvd_training = await _getFromCSV('DVD-training.csv');
    dvd_test = await _getFromCSV('DVD-testing.csv');
    ndbench_test = await _getFromCSV('NDBench-testing.csv');
    ndbench_training = await _getFromCSV('NDBench-training.csv');
    print("Initialization of DVD-TRAINING " + (dvd_training.length > 0 ? "succeded":"failed"));
    print("Initialization of DVD-TEST " + (dvd_test.length > 0 ? "succeded":"failed"));
    print("Initialization of NDBENCH-TRAINING " + (ndbench_training.length > 0 ? "succeded":"failed"));
    print("Initialization of NDBENCH-TEST " + (ndbench_test.length > 0 ? "succeded":"failed"));
  }


  List<double> getData(
      String resource, String metric, int batchUnit, int batchId, int batchSize) {
    final selection = _getDataset(resource);

    if (selection == null)
      throw ValidationException(
          ["Cannot find data set for ${resource}"]);

    final availableBatches = (selection.length / batchUnit).toInt();

    if ((batchId-1) +batchSize > (availableBatches -(batchId-1))) {
      throw ValidationException(
          ["Cannot get ${batchSize}, only have ${availableBatches} available"]);
    }

    final offset = batchUnit*(batchId-1);
    final endIndex = offset + (batchUnit)*(batchSize);

    return selection.sublist(offset, endIndex).map((row) => row[_getMetricIndex(metric)]).cast<double>().toList();
  }

  Future<List<List>> _getFromCSV(String filename) async {
    return await File('lib/resources/${filename}')
        .openRead()
        .handleError((error){
      print("Error when opening ${filename}");
    })
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

  List<List<dynamic>> _getDataset(String resource) {
    String product = resource.split('-')[0].toLowerCase();
    String dataset = resource.split('-')[1].toLowerCase();
    if (product == 'ndbench') {
      if (dataset == 'testing') {
        return ndbench_test;
      } else if (dataset == 'trainig') {
        return ndbench_training;
      }
    } else if (product == 'dvd') {
      if (dataset == 'testing') {
        return dvd_test;
      } else if (dataset == 'training') {
        return dvd_training;
      }
    }
    return null;
  }

  int _getMetricIndex(String metric){
   return _metrics.indexOf(metric.toLowerCase());
  }
}

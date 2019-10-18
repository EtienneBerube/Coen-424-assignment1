
class Data {

  var cpuUtilization_Average;
  var networkIn_Average;
  var networkOut_Average;
  var memoryUtilization_Average;
  var final_Target;

  Data.fromCSVRow(List<String> row){
    this.cpuUtilization_Average = row[0];
    this.networkIn_Average= row[1];
    this.networkOut_Average = row[2];
    this.memoryUtilization_Average = row[3];
    this.final_Target = row[4];
  }

  Data( this.cpuUtilization_Average, this.networkIn_Average, this.networkOut_Average, this.memoryUtilization_Average, this.final_Target);
}

import 'package:getxproject/data/responses/status.dart';

class ApiResponses<T> {
  Status? status;
  T? data;
  String? message;
  ApiResponses(this.status, this.data, this.message);
  ApiResponses.loading() : status = Status.LOADING;
  ApiResponses.completet(this.data) : status = Status.COMPLETED;
  ApiResponses.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status: $status\nMessage: $message\nData: $data";
  }
}

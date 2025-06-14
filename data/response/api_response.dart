import "package:cricketmania/data/response/status.dart";



class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;
  ApiResponse.loading(): status = Status.loading;
  ApiResponse.completed(this.data): status = Status.completed;
  ApiResponse.error(this.message): status = Status.error;
  @override
  String toString(){
    return "Status: $status /nData: $data/n message: $message";
  }
}
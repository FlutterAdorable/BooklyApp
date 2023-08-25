import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection TimeOut');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send TimeOut');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive TimeOut');
      case DioExceptionType.badResponse:
        return ServerFailure('bad Response');
      case DioExceptionType.cancel:
        return ServerFailure('Operation was canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('No internet connection!');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certificate');
      case DioExceptionType.unknown:
        return ServerFailure('No Internet Connection!');

    }
  }
/*
  factory ServerFailure.fromResponse(int statusCode, dynamic response)
  {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403)
    {
      return ServerFailure(response['error']['message']);
    } else if(statusCode == 404)
    {
     return ServerFailure('Your request not found, Please try again later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, Please try again later!');
    } else
    {
      return ServerFailure('Opps there was an Error, Please try again later');
    }
  }*/
}

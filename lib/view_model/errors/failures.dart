import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

abstract class Faliure {
  final String errMessage;

  const Faliure(this.errMessage);
}

class ServerFailure extends Faliure {
  ServerFailure(super.errMessage);
  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection timeout with ApiServer");
      case DioExceptionType.sendTimeout:
        return ServerFailure("Send timeout with ApiServer");

      case DioExceptionType.receiveTimeout:
        return ServerFailure("Receive timeout with ApiServer");

      case DioExceptionType.badCertificate:
        return ServerFailure("Bad Certificate");

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure("Request to ApiServer Cancelled");

      case DioExceptionType.connectionError:
        return ServerFailure("Connection timeout!");

      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException') ||
            dioError.message!
                .contains("Failed host lookup: 'www.googleapis.com'")) {
          return ServerFailure("No Internet Connection");
        }
        return ServerFailure("Unexpected error!!");
      default:
        return ServerFailure("Unexpected error!!, Try Again");
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    debugPrint('INNNN Server');
    debugPrint(statusCode.toString());
    debugPrint(response.toString());

    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      Fluttertoast.showToast(
        msg: response['title'],
        toastLength: Toast.LENGTH_LONG,
      );
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      Fluttertoast.showToast(
        msg: response['title'],
        toastLength: Toast.LENGTH_LONG,
      );
      return ServerFailure('Your Request Not Found!!');
    } else if (statusCode == 500) {
      Fluttertoast.showToast(
        msg: response['title'],
        toastLength: Toast.LENGTH_LONG,
      );
      return ServerFailure('Internal Server Error!!');
    } else {
      Fluttertoast.showToast(
        msg: response['title'],
        toastLength: Toast.LENGTH_LONG,
      );
      return ServerFailure('Opps!! There was an error, Please try again');
    }
  }
}

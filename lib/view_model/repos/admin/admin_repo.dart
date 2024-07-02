import 'package:dartz/dartz.dart';
import 'package:furni_move/model/offer/offer.model.dart';
import 'package:furni_move/model/request/request.model.dart';
import 'package:furni_move/model/user_model.dart';
import 'package:furni_move/view_model/errors/failures.dart';

abstract class AdminRepo {
  Future<Either<Faliure, List<RequestModel>>> fetchCreatedRequests(
      UserModel user);
  Future<Either<Faliure, List<RequestModel>>> fetchCompletedRequests(
    UserModel user,
  );
  Future<Either<Faliure, List<OfferModel>>> fetchOffersByRequestId(
      String id, UserModel user);
  Future<Either<Faliure, List<UserModel>>> fetchUsersbyRole(
      UserModel user, String role);
}

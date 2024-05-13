import 'package:equatable/equatable.dart';

import 'move_request.model.dart';

class OfferModel extends Equatable {
  final int? id;
  final int? price;
  final MoveRequest? moveRequest;
  final int? moveRequestId;
  final dynamic serviceProvider;
  final String? serviceProviderId;

  const OfferModel({
    this.id,
    this.price,
    this.moveRequest,
    this.moveRequestId,
    this.serviceProvider,
    this.serviceProviderId,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) => OfferModel(
        id: json['id'] as int?,
        price: json['price'] as int?,
        moveRequest: json['moveRequest'] == null
            ? null
            : MoveRequest.fromJson(json['moveRequest'] as Map<String, dynamic>),
        moveRequestId: json['moveRequestId'] as int?,
        serviceProvider: json['serviceProvider'] as dynamic,
        serviceProviderId: json['serviceProviderId'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'price': price,
        'moveRequest': moveRequest?.toJson(),
        'moveRequestId': moveRequestId,
        'serviceProvider': serviceProvider,
        'serviceProviderId': serviceProviderId,
      };

  @override
  List<Object?> get props {
    return [
      id,
      price,
      moveRequest,
      moveRequestId,
      serviceProvider,
      serviceProviderId,
    ];
  }
}

import 'package:equatable/equatable.dart';

class MoveRequest extends Equatable {
  final int? id;
  final dynamic customer;
  final String? customerId;
  final dynamic serviceProvider;
  final dynamic serviceProviderId;
  final String? status;
  final dynamic startTime;
  final dynamic endTime;
  final dynamic rating;
  final dynamic cost;
  final int? numOfAppliances;
  final List<dynamic>? appliances;
  final dynamic startLocation;
  final dynamic endLocation;
  final int? startLocationId;
  final int? endLocationId;
  final dynamic truck;
  final dynamic truckId;

  const MoveRequest({
    this.id,
    this.customer,
    this.customerId,
    this.serviceProvider,
    this.serviceProviderId,
    this.status,
    this.startTime,
    this.endTime,
    this.rating,
    this.cost,
    this.numOfAppliances,
    this.appliances,
    this.startLocation,
    this.endLocation,
    this.startLocationId,
    this.endLocationId,
    this.truck,
    this.truckId,
  });

  factory MoveRequest.fromJson(Map<String, dynamic> json) => MoveRequest(
        id: json['id'] as int?,
        customer: json['customer'] as dynamic,
        customerId: json['customerId'] as String?,
        serviceProvider: json['serviceProvider'] as dynamic,
        serviceProviderId: json['serviceProviderId'] as dynamic,
        status: json['status'] as String?,
        startTime: json['startTime'] as dynamic,
        endTime: json['endTime'] as dynamic,
        rating: json['rating'] as dynamic,
        cost: json['cost'] as dynamic,
        numOfAppliances: json['numOfAppliances'] as int?,
        appliances: json['appliances'] as List<dynamic>?,
        startLocation: json['startLocation'] as dynamic,
        endLocation: json['endLocation'] as dynamic,
        startLocationId: json['startLocationId'] as int?,
        endLocationId: json['endLocationId'] as int?,
        truck: json['truck'] as dynamic,
        truckId: json['truckId'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'customer': customer,
        'customerId': customerId,
        'serviceProvider': serviceProvider,
        'serviceProviderId': serviceProviderId,
        'status': status,
        'startTime': startTime,
        'endTime': endTime,
        'rating': rating,
        'cost': cost,
        'numOfAppliances': numOfAppliances,
        'appliances': appliances,
        'startLocation': startLocation,
        'endLocation': endLocation,
        'startLocationId': startLocationId,
        'endLocationId': endLocationId,
        'truck': truck,
        'truckId': truckId,
      };

  @override
  List<Object?> get props {
    return [
      id,
      customer,
      customerId,
      serviceProvider,
      serviceProviderId,
      status,
      startTime,
      endTime,
      rating,
      cost,
      numOfAppliances,
      appliances,
      startLocation,
      endLocation,
      startLocationId,
      endLocationId,
      truck,
      truckId,
    ];
  }
}

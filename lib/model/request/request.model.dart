import 'package:equatable/equatable.dart';

import 'customer.model.dart';
import 'end_location.model.dart';
import 'start_location.model.dart';

class RequestModel extends Equatable {
  final int? id;
  final StartLocation? startLocation;
  final EndLocation? endLocation;
  final String? customerId;
  final Customer? customer;
  final dynamic serviceProviderId;
  final dynamic serviceProvider;
  final String? status;
  final String? startDate;
  final dynamic endTime;
  final dynamic rating;
  final dynamic cost;
  final int? numOfAppliances;
  final String? startAddress;
  final String? endAddress;
  final double? distance;
  final double? eta;
  final String? vehicleType;

  const RequestModel({
    this.id,
    this.startLocation,
    this.endLocation,
    this.customerId,
    this.customer,
    this.serviceProviderId,
    this.serviceProvider,
    this.status,
    this.startDate,
    this.endTime,
    this.rating,
    this.cost,
    this.numOfAppliances,
    this.startAddress,
    this.endAddress,
    this.distance,
    this.eta,
    this.vehicleType,
  });

  factory RequestModel.fromJson(Map<String, dynamic> json) => RequestModel(
        id: json['id'] as int?,
        startLocation: json['startLocation'] == null
            ? null
            : StartLocation.fromJson(
                json['startLocation'] as Map<String, dynamic>),
        endLocation: json['endLocation'] == null
            ? null
            : EndLocation.fromJson(json['endLocation'] as Map<String, dynamic>),
        customerId: json['customerId'] as String?,
        customer: json['customer'] == null
            ? null
            : Customer.fromJson(json['customer'] as Map<String, dynamic>),
        serviceProviderId: json['serviceProviderId'] as dynamic,
        serviceProvider: json['serviceProvider'] as dynamic,
        status: json['status'] as String?,
        startDate: json['startDate'] as String?,
        endTime: json['endTime'] as dynamic,
        rating: json['rating'] as dynamic,
        cost: json['cost'] as dynamic,
        numOfAppliances: json['numOfAppliances'] as int?,
        startAddress: json['startAddress'] as String?,
        endAddress: json['endAddress'] as String?,
        distance: (json['distance'] as num?)?.toDouble(),
        eta: (json['eta'] as num?)?.toDouble(),
        vehicleType: json['vehicleType'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'startLocation': startLocation?.toJson(),
        'endLocation': endLocation?.toJson(),
        'customerId': customerId,
        'customer': customer?.toJson(),
        'serviceProviderId': serviceProviderId,
        'serviceProvider': serviceProvider,
        'status': status,
        'startDate': startDate,
        'endTime': endTime,
        'rating': rating,
        'cost': cost,
        'numOfAppliances': numOfAppliances,
        'startAddress': startAddress,
        'endAddress': endAddress,
        'distance': distance,
        'eta': eta,
        'vehicleType': vehicleType,
      };

  @override
  List<Object?> get props {
    return [
      id,
      startLocation,
      endLocation,
      customerId,
      customer,
      serviceProviderId,
      serviceProvider,
      status,
      startDate,
      endTime,
      rating,
      cost,
      numOfAppliances,
      startAddress,
      endAddress,
      distance,
      eta,
      vehicleType,
    ];
  }
}

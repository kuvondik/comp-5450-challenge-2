import 'package:flutter/material.dart';

import '../../domain/entities/clinic_service.dart';

class ClinicServiceModel extends ClinicService {
  const ClinicServiceModel({
    required super.id,
    required super.name,
    required super.shortDescription,
    required super.longDescription,
    required super.bookingUrl,
    required super.icon,
  });

  factory ClinicServiceModel.fromMap(Map<String, dynamic> map) {
    return ClinicServiceModel(
      id: map['id'] as String,
      name: map['name'] as String,
      shortDescription: map['shortDescription'] as String,
      longDescription: map['longDescription'] as String,
      bookingUrl: map['bookingUrl'] as String,
      // ignore: non_const_argument_for_const_parameter
      icon: IconData(map['iconCode'] as int, fontFamily: 'MaterialIcons'),
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'shortDescription': shortDescription,
        'longDescription': longDescription,
        'bookingUrl': bookingUrl,
        'iconCode': icon.codePoint,
      };
}

import 'package:flutter/foundation.dart';

@immutable
class OpeningHours {
  final String days;
  final String hours;
  const OpeningHours({required this.days, required this.hours});
}

@immutable
class ClinicLocation {
  final String id;
  final String name;
  final String address;
  final List<String> phones;
  final String email;
  final List<OpeningHours> openingHours;

  const ClinicLocation({
    required this.id,
    required this.name,
    required this.address,
    required this.phones,
    required this.email,
    required this.openingHours,
  });
}

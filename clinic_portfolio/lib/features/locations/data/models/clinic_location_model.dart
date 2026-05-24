import '../../domain/entities/clinic_location.dart';

class ClinicLocationModel extends ClinicLocation {
  const ClinicLocationModel({
    required super.id,
    required super.name,
    required super.address,
    required super.phones,
    required super.email,
    required super.openingHours,
  });

  factory ClinicLocationModel.fromMap(Map<String, dynamic> map) {
    final hours = (map['hours'] as List)
        .map((e) => OpeningHours(
              days: (e as Map)['days'] as String,
              hours: e['hours'] as String,
            ))
        .toList();
    return ClinicLocationModel(
      id: map['id'] as String,
      name: map['name'] as String,
      address: map['address'] as String,
      phones: List<String>.from(map['phones'] as List),
      email: map['email'] as String,
      openingHours: hours,
    );
  }
}

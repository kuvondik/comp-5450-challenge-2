import 'package:flutter/material.dart';

import '../../domain/entities/health_program.dart';

class HealthProgramModel extends HealthProgram {
  const HealthProgramModel({
    required super.id,
    required super.name,
    required super.description,
    required super.highlights,
    required super.icon,
  });

  factory HealthProgramModel.fromMap(Map<String, dynamic> map) {
    return HealthProgramModel(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      highlights: List<String>.from(map['highlights'] as List),
      // ignore: non_const_argument_for_const_parameter
      icon: IconData(map['iconCode'] as int, fontFamily: 'MaterialIcons'),
    );
  }
}

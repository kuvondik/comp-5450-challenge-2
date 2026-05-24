import 'package:flutter/material.dart';

@immutable
class ClinicService {
  final String id;
  final String name;
  final String shortDescription;
  final String longDescription;
  final IconData icon;

  const ClinicService({
    required this.id,
    required this.name,
    required this.shortDescription,
    required this.longDescription,
    required this.icon,
  });
}

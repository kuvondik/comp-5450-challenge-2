import 'package:flutter/material.dart';

@immutable
class HealthProgram {
  final String id;
  final String name;
  final String description;
  final List<String> highlights;
  final IconData icon;

  const HealthProgram({
    required this.id,
    required this.name,
    required this.description,
    required this.highlights,
    required this.icon,
  });
}

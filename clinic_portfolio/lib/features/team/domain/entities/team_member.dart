import 'package:flutter/foundation.dart';

@immutable
class TeamMember {
  final String id;
  final String name;
  final String title;
  final String specialty;
  final String bio;
  final String initials;
  final String imageUrl;
  final String bookingUrl;

  const TeamMember({
    required this.id,
    required this.name,
    required this.title,
    required this.specialty,
    required this.bio,
    required this.initials,
    required this.imageUrl,
    required this.bookingUrl,
  });
}

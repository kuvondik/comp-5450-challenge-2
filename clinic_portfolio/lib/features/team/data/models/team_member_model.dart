import '../../domain/entities/team_member.dart';

class TeamMemberModel extends TeamMember {
  const TeamMemberModel({
    required super.id,
    required super.name,
    required super.title,
    required super.specialty,
    required super.bio,
    required super.initials,
  });

  factory TeamMemberModel.fromMap(Map<String, dynamic> map) {
    return TeamMemberModel(
      id: map['id'] as String,
      name: map['name'] as String,
      title: map['title'] as String,
      specialty: map['specialty'] as String,
      bio: map['bio'] as String,
      initials: map['initials'] as String,
    );
  }
}

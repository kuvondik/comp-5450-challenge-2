import '../entities/team_member.dart';

abstract class TeamRepository {
  Future<List<TeamMember>> getAll();
  Future<TeamMember?> getById(String id);
}

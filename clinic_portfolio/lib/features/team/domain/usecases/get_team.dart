import '../entities/team_member.dart';
import '../repositories/team_repository.dart';

class GetTeamMembers {
  final TeamRepository repository;
  const GetTeamMembers(this.repository);
  Future<List<TeamMember>> call() => repository.getAll();
}

class GetTeamMemberById {
  final TeamRepository repository;
  const GetTeamMemberById(this.repository);
  Future<TeamMember?> call(String id) => repository.getById(id);
}

import '../../domain/entities/team_member.dart';
import '../../domain/repositories/team_repository.dart';
import '../datasources/team_local_datasource.dart';

class TeamRepositoryImpl implements TeamRepository {
  final TeamLocalDataSource localDataSource;
  const TeamRepositoryImpl({required this.localDataSource});

  @override
  Future<List<TeamMember>> getAll() => localDataSource.fetchAll();

  @override
  Future<TeamMember?> getById(String id) async {
    final all = await localDataSource.fetchAll();
    for (final m in all) {
      if (m.id == id) return m;
    }
    return null;
  }
}

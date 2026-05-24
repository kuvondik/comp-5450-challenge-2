import '../../domain/entities/health_program.dart';
import '../../domain/repositories/programs_repository.dart';
import '../datasources/programs_local_datasource.dart';

class ProgramsRepositoryImpl implements ProgramsRepository {
  final ProgramsLocalDataSource localDataSource;
  const ProgramsRepositoryImpl({required this.localDataSource});

  @override
  Future<List<HealthProgram>> getAll() => localDataSource.fetchAll();
}

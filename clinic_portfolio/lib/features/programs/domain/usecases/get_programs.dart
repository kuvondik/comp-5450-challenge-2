import '../entities/health_program.dart';
import '../repositories/programs_repository.dart';

class GetPrograms {
  final ProgramsRepository repository;
  const GetPrograms(this.repository);
  Future<List<HealthProgram>> call() => repository.getAll();
}

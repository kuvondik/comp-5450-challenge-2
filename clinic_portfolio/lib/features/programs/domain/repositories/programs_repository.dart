import '../entities/health_program.dart';

abstract class ProgramsRepository {
  Future<List<HealthProgram>> getAll();
}

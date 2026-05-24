import '../../domain/entities/clinic_service.dart';
import '../../domain/repositories/services_repository.dart';
import '../datasources/services_local_datasource.dart';

class ServicesRepositoryImpl implements ServicesRepository {
  final ServicesLocalDataSource localDataSource;
  const ServicesRepositoryImpl({required this.localDataSource});

  @override
  Future<List<ClinicService>> getAll() => localDataSource.fetchAll();

  @override
  Future<ClinicService?> getById(String id) async {
    final all = await localDataSource.fetchAll();
    for (final s in all) {
      if (s.id == id) return s;
    }
    return null;
  }
}

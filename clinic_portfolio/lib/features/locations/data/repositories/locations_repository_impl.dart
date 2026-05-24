import '../../domain/entities/clinic_location.dart';
import '../../domain/repositories/locations_repository.dart';
import '../datasources/locations_local_datasource.dart';

class LocationsRepositoryImpl implements LocationsRepository {
  final LocationsLocalDataSource localDataSource;
  const LocationsRepositoryImpl({required this.localDataSource});

  @override
  Future<List<ClinicLocation>> getAll() => localDataSource.fetchAll();
}

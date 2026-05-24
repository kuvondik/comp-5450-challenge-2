import '../entities/clinic_location.dart';
import '../repositories/locations_repository.dart';

class GetLocations {
  final LocationsRepository repository;
  const GetLocations(this.repository);
  Future<List<ClinicLocation>> call() => repository.getAll();
}

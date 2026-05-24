import '../entities/clinic_location.dart';

abstract class LocationsRepository {
  Future<List<ClinicLocation>> getAll();
}

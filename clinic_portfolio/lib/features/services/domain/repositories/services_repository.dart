import '../entities/clinic_service.dart';

abstract class ServicesRepository {
  Future<List<ClinicService>> getAll();
  Future<ClinicService?> getById(String id);
}

import '../entities/clinic_service.dart';
import '../repositories/services_repository.dart';

class GetServices {
  final ServicesRepository repository;
  const GetServices(this.repository);
  Future<List<ClinicService>> call() => repository.getAll();
}

class GetServiceById {
  final ServicesRepository repository;
  const GetServiceById(this.repository);
  Future<ClinicService?> call(String id) => repository.getById(id);
}

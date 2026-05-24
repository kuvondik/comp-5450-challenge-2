import '../../features/locations/data/datasources/locations_local_datasource.dart';
import '../../features/locations/data/repositories/locations_repository_impl.dart';
import '../../features/locations/domain/repositories/locations_repository.dart';
import '../../features/locations/domain/usecases/get_locations.dart';
import '../../features/programs/data/datasources/programs_local_datasource.dart';
import '../../features/programs/data/repositories/programs_repository_impl.dart';
import '../../features/programs/domain/repositories/programs_repository.dart';
import '../../features/programs/domain/usecases/get_programs.dart';
import '../../features/services/data/datasources/services_local_datasource.dart';
import '../../features/services/data/repositories/services_repository_impl.dart';
import '../../features/services/domain/repositories/services_repository.dart';
import '../../features/services/domain/usecases/get_services.dart';
import '../../features/team/data/datasources/team_local_datasource.dart';
import '../../features/team/data/repositories/team_repository_impl.dart';
import '../../features/team/domain/repositories/team_repository.dart';
import '../../features/team/domain/usecases/get_team.dart';

class ServiceLocator {
  ServiceLocator._();

  static final ServiceLocator instance = ServiceLocator._();

  // Services feature ----------------------------------------------------------
  late final ServicesRepository servicesRepository = ServicesRepositoryImpl(
    localDataSource: const ServicesLocalDataSourceImpl(),
  );
  late final GetServices getServices = GetServices(servicesRepository);
  late final GetServiceById getServiceById = GetServiceById(servicesRepository);

  // Programs feature ----------------------------------------------------------
  late final ProgramsRepository programsRepository = ProgramsRepositoryImpl(
    localDataSource: const ProgramsLocalDataSourceImpl(),
  );
  late final GetPrograms getPrograms = GetPrograms(programsRepository);

  // Team feature --------------------------------------------------------------
  late final TeamRepository teamRepository = TeamRepositoryImpl(
    localDataSource: const TeamLocalDataSourceImpl(),
  );
  late final GetTeamMembers getTeamMembers = GetTeamMembers(teamRepository);
  late final GetTeamMemberById getTeamMemberById =
      GetTeamMemberById(teamRepository);

  // Locations feature ---------------------------------------------------------
  late final LocationsRepository locationsRepository = LocationsRepositoryImpl(
    localDataSource: const LocationsLocalDataSourceImpl(),
  );
  late final GetLocations getLocations = GetLocations(locationsRepository);
}

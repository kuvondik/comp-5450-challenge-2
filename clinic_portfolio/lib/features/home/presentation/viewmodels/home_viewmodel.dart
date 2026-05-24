import 'package:flutter/foundation.dart';

import '../../../../shared/presentation/state/view_state.dart';
import '../../../services/domain/entities/clinic_service.dart';
import '../../../services/domain/usecases/get_services.dart';
import '../../../team/domain/entities/team_member.dart';
import '../../../team/domain/usecases/get_team.dart';

class HomeViewModel extends ChangeNotifier {
  final GetServices _getServices;
  final GetTeamMembers _getTeamMembers;

  HomeViewModel({
    required GetServices getServices,
    required GetTeamMembers getTeamMembers,
  })  : _getServices = getServices,
        _getTeamMembers = getTeamMembers;

  ViewState<List<ClinicService>> featuredServices = const ViewState.idle();
  ViewState<List<TeamMember>> featuredTeam = const ViewState.idle();

  Future<void> load() async {
    featuredServices = const ViewState.loading();
    featuredTeam = const ViewState.loading();
    notifyListeners();

    try {
      final services = await _getServices();
      featuredServices = ViewState.success(services.take(6).toList());
    } catch (e) {
      featuredServices = ViewState.error('Could not load services.');
    }

    try {
      final team = await _getTeamMembers();
      featuredTeam = ViewState.success(team.take(4).toList());
    } catch (e) {
      featuredTeam = ViewState.error('Could not load team.');
    }

    notifyListeners();
  }
}

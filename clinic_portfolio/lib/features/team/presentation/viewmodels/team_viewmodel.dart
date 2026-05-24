import 'package:flutter/foundation.dart';

import '../../../../shared/presentation/state/view_state.dart';
import '../../domain/entities/team_member.dart';
import '../../domain/usecases/get_team.dart';

class TeamViewModel extends ChangeNotifier {
  final GetTeamMembers _getTeamMembers;
  TeamViewModel({required GetTeamMembers getTeamMembers})
      : _getTeamMembers = getTeamMembers;

  ViewState<List<TeamMember>> state = const ViewState.idle();

  Future<void> load() async {
    state = const ViewState.loading();
    notifyListeners();
    try {
      state = ViewState.success(await _getTeamMembers());
    } catch (_) {
      state = const ViewState.error('Could not load team.');
    }
    notifyListeners();
  }
}

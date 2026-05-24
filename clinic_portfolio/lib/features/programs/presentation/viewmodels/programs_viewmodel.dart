import 'package:flutter/foundation.dart';

import '../../../../shared/presentation/state/view_state.dart';
import '../../domain/entities/health_program.dart';
import '../../domain/usecases/get_programs.dart';

class ProgramsViewModel extends ChangeNotifier {
  final GetPrograms _getPrograms;
  ProgramsViewModel({required GetPrograms getPrograms})
      : _getPrograms = getPrograms;

  ViewState<List<HealthProgram>> state = const ViewState.idle();

  Future<void> load() async {
    state = const ViewState.loading();
    notifyListeners();
    try {
      state = ViewState.success(await _getPrograms());
    } catch (_) {
      state = const ViewState.error('Could not load programs.');
    }
    notifyListeners();
  }
}

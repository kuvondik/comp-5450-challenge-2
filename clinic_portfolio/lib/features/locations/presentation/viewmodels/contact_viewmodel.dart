import 'package:flutter/foundation.dart';

import '../../../../shared/presentation/state/view_state.dart';
import '../../domain/entities/clinic_location.dart';
import '../../domain/usecases/get_locations.dart';

class ContactViewModel extends ChangeNotifier {
  final GetLocations _getLocations;
  ContactViewModel({required GetLocations getLocations})
      : _getLocations = getLocations;

  ViewState<List<ClinicLocation>> state = const ViewState.idle();

  Future<void> load() async {
    state = const ViewState.loading();
    notifyListeners();
    try {
      state = ViewState.success(await _getLocations());
    } catch (_) {
      state = const ViewState.error('Could not load locations.');
    }
    notifyListeners();
  }
}

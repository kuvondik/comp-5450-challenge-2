import 'package:flutter/foundation.dart';

import '../../../../shared/presentation/state/view_state.dart';
import '../../domain/entities/clinic_service.dart';
import '../../domain/usecases/get_services.dart';

class ServicesViewModel extends ChangeNotifier {
  final GetServices _getServices;

  ServicesViewModel({required GetServices getServices})
      : _getServices = getServices;

  ViewState<List<ClinicService>> state = const ViewState.idle();
  String _query = '';

  String get query => _query;

  List<ClinicService> get filteredServices {
    final all = state.data ?? const <ClinicService>[];
    if (_query.isEmpty) return all;
    final q = _query.toLowerCase();
    return all
        .where((s) =>
            s.name.toLowerCase().contains(q) ||
            s.shortDescription.toLowerCase().contains(q))
        .toList();
  }

  Future<void> load() async {
    state = const ViewState.loading();
    notifyListeners();
    try {
      final services = await _getServices();
      state = ViewState.success(services);
    } catch (_) {
      state = const ViewState.error('Could not load services.');
    }
    notifyListeners();
  }

  void setQuery(String value) {
    _query = value;
    notifyListeners();
  }
}

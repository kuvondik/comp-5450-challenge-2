import '../../domain/entities/clinic_location.dart';
import '../models/clinic_location_model.dart';

abstract class LocationsLocalDataSource {
  Future<List<ClinicLocationModel>> fetchAll();
}

class LocationsLocalDataSourceImpl implements LocationsLocalDataSource {
  const LocationsLocalDataSourceImpl();

  @override
  Future<List<ClinicLocationModel>> fetchAll() async {
    await Future.delayed(const Duration(milliseconds: 250));
    return const [
      ClinicLocationModel(
        id: 'toronto',
        name: 'Downtown Toronto',
        address: '39 Lower Simcoe Street, Toronto, ON M5J 3A6',
        phones: ['(416) 504-0628', '(416) 504-2009'],
        email: 'Info@infinityhealthcentre.com',
        openingHours: [
          OpeningHours(days: 'Monday – Friday', hours: '8:00 AM – 8:00 PM'),
          OpeningHours(days: 'Saturday – Sunday', hours: '10:00 AM – 3:00 PM'),
        ],
      ),
      ClinicLocationModel(
        id: 'oakville',
        name: 'Oakville',
        address: '2441 Lakeshore Rd W, Oakville, ON L6L 5V5',
        phones: ['(905) 847-2021', '(905) 847-5042'],
        email: 'Health@infinityhealthcentre.com',
        openingHours: [
          OpeningHours(days: 'Monday, Wednesday, Friday', hours: '9:00 AM – 5:00 PM'),
          OpeningHours(days: 'Tuesday', hours: '9:00 AM – 8:00 PM'),
          OpeningHours(days: 'Thursday', hours: '9:00 AM – 7:00 PM'),
          OpeningHours(days: 'Saturday – Sunday', hours: 'Closed'),
        ],
      ),
    ];
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../features/home/presentation/viewmodels/home_viewmodel.dart';
import '../features/locations/presentation/viewmodels/contact_viewmodel.dart';
import '../features/programs/presentation/viewmodels/programs_viewmodel.dart';
import '../features/services/presentation/viewmodels/services_viewmodel.dart';
import '../features/splash/presentation/views/splash_page.dart';
import '../features/team/presentation/viewmodels/team_viewmodel.dart';
import '../shared/constants/app_constants.dart';
import 'di/service_locator.dart';
import 'theme/app_theme.dart';

class ClinicPortfolioApp extends StatelessWidget {
  const ClinicPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    final sl = ServiceLocator.instance;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeViewModel(
            getServices: sl.getServices,
            getTeamMembers: sl.getTeamMembers,
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => ServicesViewModel(getServices: sl.getServices),
        ),
        ChangeNotifierProvider(
          create: (_) => ProgramsViewModel(getPrograms: sl.getPrograms),
        ),
        ChangeNotifierProvider(
          create: (_) => TeamViewModel(getTeamMembers: sl.getTeamMembers),
        ),
        ChangeNotifierProvider(
          create: (_) => ContactViewModel(getLocations: sl.getLocations),
        ),
      ],
      child: MaterialApp(
        title: AppConstants.appName,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        home: const SplashPage(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'app/app.dart';
import 'shared/constants/app_branding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Decode the SVG once before the first frame so every AppLogo renders
  // from a warm cache — prevents the lazy-decode rasterisation artefact.
  final loader = SvgAssetLoader(AppBranding.logo);
  await svg.cache.putIfAbsent(loader.cacheKey(null), () => loader.loadBytes(null));

  runApp(const ClinicPortfolioApp());
}

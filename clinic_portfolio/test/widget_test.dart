import 'package:flutter_test/flutter_test.dart';

import 'package:clinic_portfolio/app/app.dart';

void main() {
  testWidgets('App renders the clinic name on the hero', (tester) async {
    await tester.pumpWidget(const ClinicPortfolioApp());
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.text('Infinity Health Centre'), findsWidgets);
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:playground_flutter_project/designsystem/theme/app_theme_data.dart';
import 'package:playground_flutter_project/feature/trip/home/widgets/trip_booking_card.dart';

void main() {
  testWidgets('TripBookingCard displays correct information', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(
      1200,
      2900,
    ); // 400x966 logical - tall enough
    tester.view.devicePixelRatio = 3.0;

    // ScreenUtil needs to be initialized
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                // Center the card
                child: SingleChildScrollView(
                  // Allow scrolling if height is still an issue
                  child: TripBookingCard(
                    onBookTap: () {},
                    onReferTap: () {},
                    onTripPassTap: () {},
                    onChallanTap: () {},
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );

    await tester.pumpAndSettle();

    // Reset size after test
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    // Verify Header
    expect(find.text('Available 20'), findsOneWidget);
    expect(find.text('Reserve 02/00'), findsOneWidget);
    expect(find.text('Sold 16/12'), findsOneWidget);
    expect(find.text('TK 1,450'), findsOneWidget);

    // Verify Coach Info (RichText/TextSpan splitting might make direct text match tricky, so check parts)
    expect(find.textContaining('Coach:'), findsOneWidget);
    // " 406 | Non-Ac | Business (Sleeper)" part
    expect(
      find.byWidgetPredicate((widget) {
        if (widget is RichText) {
          final text = widget.text.toPlainText();
          return text.contains('406 | Non-Ac | Business (Sleeper)');
        }
        return false;
      }),
      findsOneWidget,
    );

    // Verify Time and Date
    expect(find.text('Trip Time & Date'), findsOneWidget);
    expect(find.text('12-Aug-2025 | 12:50 PM'), findsOneWidget);
    expect(find.text('Boarding Time & Date'), findsOneWidget);
    expect(find.text('12-Aug-2025 | 5:50 PM'), findsOneWidget);

    // Verify Route
    expect(find.text('Route: '), findsOneWidget);
    expect(
      find.text('Nilphamari - Rangpur - Bogura - Sirajganj-Tangail-C..'),
      findsOneWidget,
    );

    // Verify Buttons
    expect(find.text('Trip Pass'), findsOneWidget);
    expect(find.text('Challan'), findsOneWidget);
    expect(find.text('Book'), findsOneWidget);
    expect(find.text('Refer'), findsOneWidget);
  });
}

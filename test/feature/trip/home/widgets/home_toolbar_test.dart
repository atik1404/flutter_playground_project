import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:playground_flutter_project/designsystem/theme/app_theme_data.dart';
import 'package:playground_flutter_project/feature/trip/home/widgets/home_toolbar.dart';

void main() {
  testWidgets('HomeToolbar renders correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return MaterialApp(
            theme: AppThemeData.light(),
            home: const Scaffold(body: HomeToolbar()),
          );
        },
      ),
    );

    // Verify that the toolbar title is present
    // Note: The text might be split across widgets or have different styling,
    // but we can search for the text content.
    // However, since it's "Hanif North Counter" inside an AppText which wraps Text/RichText
    expect(find.text('Hanif North Counter'), findsOneWidget);

    // Verify "Today's" chip is present
    expect(find.text("Today's"), findsOneWidget);

    // Verify icons are present (just checking basic existence of some icons)
    expect(find.byIcon(Icons.grid_view_outlined), findsOneWidget);
    expect(find.byIcon(Icons.search), findsOneWidget);
  });
}

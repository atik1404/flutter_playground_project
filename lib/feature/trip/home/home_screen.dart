import 'package:flutter/material.dart';
import 'package:playground_flutter_project/feature/trip/home/widgets/home_toolbar.dart';
import 'package:playground_flutter_project/feature/trip/home/widgets/trip_booking_card.dart';
import 'package:playground_flutter_project/ui/components/app_scaffold.dart';
import 'package:playground_flutter_project/ui/components/spacer_box.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      body: Column(
        children: [
          HomeToolbar(),
          SpacerBox(height: 50), // Space between toolbar and booking card
          TripBookingCard(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playground_flutter_project/designsystem/dimensions/app_spacing.dart';
import 'package:playground_flutter_project/designsystem/extensions/theme_context_extension.dart';
import 'package:playground_flutter_project/feature/trip/home/bloc/home_bloc.dart';
import 'package:playground_flutter_project/feature/trip/home/bloc/home_event.dart';
import 'package:playground_flutter_project/feature/trip/home/widgets/home_toolbar.dart';
import 'package:playground_flutter_project/feature/trip/home/widgets/trip_booking_card.dart';
import 'package:playground_flutter_project/ui/components/app_scaffold.dart';
import 'package:playground_flutter_project/ui/components/spacer_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    context.read<HomeBloc>().add(const HomeEvent.fetchTrips(1));
  }

  @override
  Widget build(BuildContext context) {
    final spaceSize = context.spacingSizes;

    return AppScaffold(
      body: Column(
        children: [
          const HomeToolbar(),
          SpacerBox(
            height: spaceSize.md,
          ), // Space between toolbar and booking card
          Expanded(child: _buildTripList(context, [])),
        ],
      ),
    );
  }

  Widget _buildTripList(BuildContext context, List<String> trips) {
    final spaceSize = context.spacingSizes;

    return RefreshIndicator(
      onRefresh: () async => {},
      child: ListView.builder(
        itemCount: 20,
        padding: AppSpacing.only(
          bottom: spaceSize.xxl,
          top: spaceSize.md,
          start: spaceSize.md,
          end: spaceSize.md,
        ),
        itemBuilder: (context, index) => const TripBookingCard(),
      ),
    );
  }
}

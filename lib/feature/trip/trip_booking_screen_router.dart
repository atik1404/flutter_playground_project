import 'package:go_router/go_router.dart';
import 'package:playground_flutter_project/core/router/app_routes_name.dart';
import 'package:playground_flutter_project/core/router/base_router.dart';
import 'package:playground_flutter_project/domain/entities/apientity/trip/trip_api_entity.dart';
import 'package:playground_flutter_project/feature/trip/booking/trip_booking_screen.dart';

final class TripBookingScreenRouter extends BaseRouter {
  @override
  List<GoRoute> get routes => [
    GoRoute(
      path: AppRoutesName.tripBookingScreen,
      builder: (context, state) {
        final extra = state.extra! as TripApiEntity;

        return TripBookingScreen(trip: extra);
      },
    ),
  ];
}

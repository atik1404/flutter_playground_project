final class TripApiEntity {
  final String tripId;
  final String tripHeading;
  final String tripNo;
  final String departureDateTime;
  final String arrivalDateTime;
  final String routeName;
  final String direction;
  final String busNumber;
  final String busType;
  final String seatCount;
  final int totalReservedMale;
  final int totalReservedFemale;
  final int totalSoldMale;
  final int totalSoldFemale;
  final List<int> amount;

  TripApiEntity({
    required this.tripId,
    required this.tripHeading,
    required this.tripNo,
    required this.departureDateTime,
    required this.arrivalDateTime,
    required this.routeName,
    required this.direction,
    required this.busNumber,
    required this.busType,
    required this.seatCount,
    required this.totalReservedMale,
    required this.totalReservedFemale,
    required this.totalSoldMale,
    required this.totalSoldFemale,
    required this.amount,
  });
}

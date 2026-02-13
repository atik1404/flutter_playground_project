import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jiffy/jiffy.dart';
import 'package:playground_flutter_project/designsystem/dimensions/app_spacing.dart';
import 'package:playground_flutter_project/designsystem/extensions/theme_context_extension.dart';
import 'package:playground_flutter_project/domain/entities/apientity/trip/trip_api_entity.dart';
import 'package:playground_flutter_project/ui/components/app_text.dart';
import 'package:playground_flutter_project/ui/components/spacer_box.dart';

class BookingTripCard extends StatelessWidget {
  final TripApiEntity trip;

  const BookingTripCard({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    final radius = context.shapeRadius;
    final spacing = context.spacingSizes;

    return Container(
      padding: AppSpacing.all(spacing.md),
      decoration: BoxDecoration(
        color: context.backgroundColors.item,
        borderRadius: BorderRadius.circular(radius.md),
        border: Border.all(color: context.appColors.primary, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          SpacerBox(height: spacing.sm),
          _buildCoachInfo(context),
          SpacerBox(height: spacing.sm),
          _buildTimeAndDate(context),
          SpacerBox(height: spacing.sm),
          AppText(
            "Route: ${trip.routeName}",
            style: context.typography.bodySmallSemiBold,
            color: context.textColors.primary,
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final backgroundColor = context.backgroundColors;
    final textColors = context.textColors;
    final spacing = context.spacingSizes;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Wrap(
            spacing: spacing.xs,
            runSpacing: spacing.xs,
            children: [
              _buildBadge(
                context,
                "Available ${trip.seatCount}",
                backgroundColor.jungleGreen,
                textColors.jungleGreen,
              ),
              _buildBadge(
                context,
                "Reserve ${trip.totalReservedMale}/${trip.totalReservedFemale}",
                backgroundColor.turquoise,
                textColors.turquoise,
              ),
              _buildBadge(
                context,
                "Sold ${trip.totalSoldMale}/${trip.totalSoldFemale}",
                backgroundColor.indigo,
                textColors.indigo,
              ),
            ],
          ),
        ),
        AppText(
          "TK ${trip.amount.first}",
          style: context.typography.titleSmallSemiBold,
          color: textColors.navyBlue,
        ),
      ],
    );
  }

  Widget _buildBadge(
    BuildContext context,
    String text,
    Color bgColor,
    Color textColor,
  ) {
    final spacing = context.spacingSizes;

    return Container(
      padding: AppSpacing.symmetric(
        horizontal: spacing.xs,
        vertical: spacing.xs,
      ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(context.shapeRadius.xs),
      ),
      child: AppText(
        text,
        style: context.typography.bodyExtraSmallMedium.copyWith(
          fontSize: 10.sp,
        ),
        color: textColor,
      ),
    );
  }

  Widget _buildCoachInfo(BuildContext context) {
    return AppText(
      "Coach: ${trip.tripNo} | ${trip.busType} | ${trip.direction}",
      style: context.typography.bodySmallRegular,
      color: context.textColors.secondary,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildTimeAndDate(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: _buildDateTimeColumn(
            context,
            "Trip Time & Date",
            "${_parseDate(trip.arrivalDateTime)} | ${_parseTime(trip.arrivalDateTime)}",
            CrossAxisAlignment.start,
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: _buildDateTimeColumn(
            context,
            "Boarding Time & Date",
            "${_parseDate(trip.departureDateTime)} | ${_parseTime(trip.departureDateTime)}",
            CrossAxisAlignment.end,
          ),
        ),
      ],
    );
  }

  Widget _buildDateTimeColumn(
    BuildContext context,
    String label,
    String value,
    CrossAxisAlignment alignment,
  ) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        AppText(
          label,
          style: context.typography.bodySmallSemiBold,
          fontSize: 10.sp,
        ),
        AppText(
          value,
          style: context.typography.bodySmallMedium,
          color: context.textColors.secondary,
        ),
      ],
    );
  }

  String _parseDate(String date) {
    return Jiffy.parse(date).yMMMd;
  }

  String _parseTime(String date) {
    return Jiffy.parse(date).jm;
  }
}

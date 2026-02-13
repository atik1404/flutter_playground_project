import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jiffy/jiffy.dart';
import 'package:playground_flutter_project/designsystem/dimensions/app_spacing.dart';
import 'package:playground_flutter_project/designsystem/extensions/theme_context_extension.dart';
import 'package:playground_flutter_project/domain/entities/apientity/trip/trip_api_entity.dart';
import 'package:playground_flutter_project/ui/components/app_text.dart';
import 'package:playground_flutter_project/ui/components/button/app_filled_button.dart';
import 'package:playground_flutter_project/ui/components/button/app_outline_button.dart';
import 'package:playground_flutter_project/ui/components/base/app_button.dart';
import 'package:playground_flutter_project/ui/components/dashed_divider.dart';
import 'package:playground_flutter_project/ui/components/spacer_box.dart';

class TripBookingCard extends StatelessWidget {
  final VoidCallback onBookTap;
  final VoidCallback onReferTap;
  final VoidCallback onTripPassTap;
  final VoidCallback onChallanTap;
  final TripApiEntity trip;

  const TripBookingCard({
    super.key,
    required this.onBookTap,
    required this.onReferTap,
    required this.onTripPassTap,
    required this.onChallanTap,
    required this.trip,
  });

  @override
  Widget build(BuildContext context) {
    final strokeColors = context.strokeColors;
    final radius = context.shapeRadius;
    final spacing = context.spacingSizes;

    return Container(
      padding: AppSpacing.all(spacing.md),
      margin: AppSpacing.only(top: spacing.md),
      decoration: BoxDecoration(
        color: context.backgroundColors.item,
        borderRadius: BorderRadius.circular(radius.md),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          SpacerBox(height: spacing.sm),
          _buildCoachInfo(context),
          SpacerBox(height: spacing.sm),
          DashedDivider(
            color: strokeColors.primary, // Placeholder for subtle divider
          ),
          SpacerBox(height: spacing.sm),
          _buildTimeAndDate(context),
          SpacerBox(height: spacing.sm),
          DashedDivider(
            color: strokeColors.primary, // Placeholder for subtle divider
          ),
          SpacerBox(height: spacing.sm),
          _buildRoute(context),
          SpacerBox(height: spacing.sm),
          _buildActions(context),
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
            spacing: spacing.sm,
            runSpacing: spacing.sm,
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
        vertical: spacing.sm,
      ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(context.shapeRadius.sm),
      ),
      child: AppText(
        text,
        style: context.typography.bodyExtraSmallMedium,
        color: textColor,
      ),
    );
  }

  Widget _buildCoachInfo(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText("Coach: ", style: context.typography.bodySmallSemiBold),
        Expanded(
          child: AppText(
            "${trip.tripNo} - ${trip.busType} - ${trip.direction}",
            style: context.typography.bodySmallRegular,
            color: context.textColors.secondary,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
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
        AppText(label, style: context.typography.bodySmallSemiBold),
        SpacerBox(height: context.spacingSizes.sm),
        AppText(
          value,
          style: context.typography.bodySmallMedium,
          color: context.textColors.secondary,
        ),
      ],
    );
  }

  Widget _buildRoute(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText("Route: ", style: context.typography.bodySmallSemiBold),
        Expanded(
          child: AppText(
            trip.routeName,
            style: context.typography.bodySmallRegular,
            color: context.textColors.secondary,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildActions(BuildContext context) {
    final spacing = context.spacingSizes;
    final iconSize = context.iconSizes;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AppOutlineButton(
            label: "Trip Pass",
            onPressed: () {},
            leadingIcon: Icon(Icons.check, size: iconSize.xs),
            size: AppButtonSize.small,
          ),
          SpacerBox(width: spacing.md),
          AppOutlineButton(
            label: "Challan",
            onPressed: () {},
            trailingIcon: Icon(Icons.list_alt, size: iconSize.xs),
            size: AppButtonSize.small,
          ),
          SpacerBox(width: spacing.md),
          AppFilledButton(
            label: "Book",
            onPressed: () {},
            size: AppButtonSize.small,
          ),
        ],
      ),
    );
  }

  String _parseDate(String date) {
    return Jiffy.parse(date).yMMMd;
  }

  String _parseTime(String date) {
    return Jiffy.parse(date).jm;
  }
}

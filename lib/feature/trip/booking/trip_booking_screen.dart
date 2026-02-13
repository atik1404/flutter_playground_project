import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:playground_flutter_project/designsystem/dimensions/app_spacing.dart';
import 'package:playground_flutter_project/designsystem/extensions/theme_context_extension.dart';
import 'package:playground_flutter_project/domain/entities/apientity/trip/trip_api_entity.dart';
import 'package:playground_flutter_project/feature/trip/booking/widgets/booking_forms_widget.dart';
import 'package:playground_flutter_project/feature/trip/booking/widgets/booking_trip_card.dart';
import 'package:playground_flutter_project/feature/trip/booking/widgets/seat_layout_widget.dart';
import 'package:playground_flutter_project/ui/components/app_scaffold.dart';
import 'package:playground_flutter_project/ui/components/app_text.dart';
import 'package:playground_flutter_project/ui/components/base/app_button.dart';
import 'package:playground_flutter_project/ui/components/button/app_filled_button.dart';
import 'package:playground_flutter_project/ui/components/spacer_box.dart';

class TripBookingScreen extends StatelessWidget {
  final TripApiEntity trip;

  const TripBookingScreen({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacingSizes;

    return AppScaffold(
      appbar: AppBar(
        title: AppText(
          "Ticket Booking",
          style: context.typography.titleSmallSemiBold,
        ),
        actions: [
          Padding(
            padding: AppSpacing.only(end: spacing.md),
            child: AppFilledButton(
              label: "Staff & Trip Details",
              onPressed: () {},
              size: AppButtonSize.small,
              backgroundColor: context.backgroundColors.secondary,
              foregroundColor: context.textColors.primary,
            ),
          ),
          Padding(
            padding: AppSpacing.only(end: spacing.md),
            child: AppFilledButton(
              label: "Refresh",
              onPressed: () {},
              trailingIcon: Icon(
                Icons.refresh,
                size: context.iconSizes.xs,
                color: context.textColors.primary,
              ),
              size: AppButtonSize.small,
              backgroundColor: context.backgroundColors.secondary,
              foregroundColor: context.textColors.primary,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: AppSpacing.all(spacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BookingTripCard(trip: trip),
            SpacerBox(height: spacing.lg),
            _buildSubRouteFare(context),
            SpacerBox(height: spacing.md),
            _buildTicketTypeTabs(context),
            SpacerBox(height: spacing.md),
            const SeatLayoutWidget(),
            SpacerBox(height: spacing.lg),
            const BookingFormsWidget(),
            SpacerBox(height: spacing.xl),
            SizedBox(
              width: double.infinity,
              child: AppFilledButton(
                label: "Add Goods",
                onPressed: () {},
                leadingIcon: Icon(
                  Icons.add,
                  size: context.iconSizes.sm,
                  color: context.textColors.white,
                ),
                backgroundColor:
                    context.backgroundColors.secondary, // Light blueish
                foregroundColor: context.textColors.primary,
              ),
            ),
            SpacerBox(height: spacing.xxl),
            _buildBottomBar(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSubRouteFare(BuildContext context) {
    final spacing = context.spacingSizes;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          "Sub Route Fare",
          style: context.typography.bodySmallRegular,
          color: context.textColors.secondary,
        ),
        SpacerBox(height: spacing.xs),
        Container(
          padding: AppSpacing.symmetric(
            horizontal: spacing.sm,
            vertical: spacing.sm,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: context.strokeColors.primary),
            borderRadius: BorderRadius.circular(context.shapeRadius.sm),
            color: context.backgroundColors.item,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                "Dhaka [Kademtoli] - Khulna - 650",
                style: context.typography.bodyMediumRegular,
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: context.textColors.secondary,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTicketTypeTabs(BuildContext context) {
    final spacing = context.spacingSizes;
    return Container(
      padding: AppSpacing.all(spacing.xs),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.shapeRadius.lg),
        color: context.backgroundColors.item,
      ),
      child: Row(
        children: [
          Expanded(child: _buildTab(context, "Ticket", true)),
          Expanded(
            child: _buildTab(context, "Reserve Ticket", false),
          ), // Using dummy selection
          Expanded(child: _buildTab(context, "VIP Ticket", false)),
        ],
      ),
    );
  }

  Widget _buildTab(BuildContext context, String label, bool isSelected) {
    final spacing = context.spacingSizes;
    return Container(
      padding: AppSpacing.symmetric(vertical: spacing.sm),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected ? context.appColors.primary : Colors.transparent,
        borderRadius: BorderRadius.circular(context.shapeRadius.lg),
        border: isSelected
            ? null
            : Border.all(
                color: context.strokeColors.primary.withOpacity(0.3),
              ), // Dotted/dashed placeholder
      ),
      child: AppText(
        label,
        style: context.typography.bodySmallMedium,
        color: isSelected
            ? context.textColors.white
            : context.textColors.secondary,
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    final spacing = context.spacingSizes;
    return Container(
      padding: AppSpacing.all(spacing.md),
      decoration: BoxDecoration(
        color: context.appColors.primary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(context.shapeRadius.md),
          topRight: Radius.circular(context.shapeRadius.md),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                "3 Seats",
                style: context.typography.bodyMediumSemiBold,
                color: context.textColors.white,
              ),
              AppText(
                "TK 1,850",
                style: context.typography.titleMediumBold,
                color: context.textColors.white,
              ),
            ],
          ),
          AppFilledButton(
            label: "Next",
            onPressed: () {},
            size: AppButtonSize.medium,
            backgroundColor: context.backgroundColors.item,
            foregroundColor: context.textColors.primary,
          ),
        ],
      ),
    );
  }
}

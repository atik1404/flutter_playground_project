import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:playground_flutter_project/designsystem/dimensions/app_spacing.dart';

import 'package:playground_flutter_project/designsystem/theme/colors/color_pallet.dart';
import 'package:playground_flutter_project/designsystem/extensions/theme_context_extension.dart';
import 'package:playground_flutter_project/ui/components/app_text.dart';
import 'package:playground_flutter_project/ui/components/button/app_filled_button.dart';
import 'package:playground_flutter_project/ui/components/button/app_outline_button.dart';
import 'package:playground_flutter_project/ui/components/base/app_button.dart';
import 'package:playground_flutter_project/ui/components/dashed_divider.dart';
import 'package:playground_flutter_project/ui/components/multi_color_text.dart';
import 'package:playground_flutter_project/ui/components/spacer_box.dart';

class TripBookingCard extends StatelessWidget {
  final VoidCallback? onBookTap;
  final VoidCallback? onReferTap;
  final VoidCallback? onTripPassTap;
  final VoidCallback? onChallanTap;

  const TripBookingCard({
    super.key,
    this.onBookTap,
    this.onReferTap,
    this.onTripPassTap,
    this.onChallanTap,
  });

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    final strokeColors = context.strokeColors;
    final radius = context.shapeRadius;
    final spacing = context.spacingSizes;
    final typography = context.typography;

    return Container(
      padding: AppSpacing.all(spacing.md),
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
            color: strokeColors.secondary, // Placeholder for subtle divider
          ),
          SpacerBox(height: spacing.sm),
          _buildTimeAndDate(context),
          SpacerBox(height: spacing.sm),
          DashedDivider(
            color: strokeColors.secondary, // Placeholder for subtle divider
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

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: [
              _buildBadge(
                context,
                "Available 20",
                backgroundColor.item,
                textColors.info,
              ),
              _buildBadge(
                context,
                "Reserve 02/00",
                backgroundColor.item,
                textColors.info,
              ),
              _buildBadge(
                context,
                "Sold 16/12",
                backgroundColor.item,
                textColors.info,
              ),
            ],
          ),
        ),
        AppText("TK 1,450", style: context.typography.titleSmallSemiBold),
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
        vertical: spacing.xxs,
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
    return MultiColorText(
      textSpans: [
        TextSpan(text: "Coach:", style: context.typography.bodySmallSemiBold),
        TextSpan(
          text: " 406 | Non-Ac | Business (Sleeper)",
          style: context.typography.bodySmallRegular,
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
            "12-Aug-2025 | 12:50 PM",
            CrossAxisAlignment.start,
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: _buildDateTimeColumn(
            context,
            "Boarding Time & Date",
            "12-Aug-2025 | 5:50 PM",
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
        SizedBox(height: 4.h),
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
            "Nilphamari - Rangpur - Bogura - Sirajganj-Tangail-C..",
            style: context.typography.bodySmallRegular,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildActions(BuildContext context) {
    final spacing = context.spacingSizes;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AppOutlineButton(
            label: "Trip Pass",
            onPressed: () {},
            leadingIcon: Icon(Icons.check, size: 12.w),
            size: AppButtonSize.small,
          ),
          SpacerBox(width: spacing.md),
          AppOutlineButton(
            label: "Challan",
            onPressed: () {},
            trailingIcon: Icon(Icons.list_alt, size: 12.w),
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
}

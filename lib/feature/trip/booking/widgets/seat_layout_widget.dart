import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:playground_flutter_project/designsystem/dimensions/app_spacing.dart';
import 'package:playground_flutter_project/designsystem/extensions/theme_context_extension.dart';
import 'package:playground_flutter_project/ui/components/app_text.dart';
import 'package:playground_flutter_project/ui/components/spacer_box.dart';

class SeatLayoutWidget extends StatelessWidget {
  const SeatLayoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacingSizes;

    return Container(
      padding: AppSpacing.all(spacing.md),
      decoration: BoxDecoration(
        color: context.backgroundColors.secondary,
        borderRadius: BorderRadius.circular(context.shapeRadius.md),
        border: Border.all(
          color: context.strokeColors.primary.withOpacity(0.1),
        ),
      ),
      child: Column(
        children: [
          _buildLegend(context),
          Divider(
            height: spacing.lg,
            color: context.strokeColors.primary.withOpacity(0.2),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDeckTab(context, "UPPER DECK", false),
              SpacerBox(width: spacing.md),
              Expanded(
                child: _buildSeatGrid(context, true),
              ), // Upper Deck Seats mockup
            ],
          ),
          SpacerBox(height: spacing.lg),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDeckTab(context, "LOWER DECK", true),
              SpacerBox(width: spacing.md),
              Expanded(
                child: _buildSeatGrid(context, false),
              ), // Lower Deck Seats mockup
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLegend(BuildContext context) {
    return Wrap(
      spacing: 12.w,
      runSpacing: 8.h,
      alignment: WrapAlignment.center,
      children: [
        _buildLegendItem(
          context,
          "Processing",
          context.backgroundColors.primary,
          borderColor: context.textColors.error,
        ),
        _buildLegendItem(context, "Selected", context.appColors.primary),
        _buildLegendItem(
          context,
          "Reserved (M)",
          context.appColors.secondary,
        ), // Assuming teal/secondary for male
        _buildLegendItem(
          context,
          "Reserved (F)",
          context.appColors.error,
        ), // Assuming error/red for female
        _buildLegendItem(context, "Male", context.appColors.secondary),
        _buildLegendItem(
          context,
          "Female",
          context.appColors.error.withOpacity(0.5),
        ),
        _buildLegendItem(
          context,
          "Tiki",
          context.appColors.primary,
          icon: Icons.airplane_ticket,
        ),
        _buildLegendItem(
          context,
          "Own",
          context.appColors.primary,
          icon: Icons.person,
        ),
      ],
    );
  }

  Widget _buildLegendItem(
    BuildContext context,
    String label,
    Color color, {
    Color? borderColor,
    IconData? icon,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12.w,
          height: 12.w,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2.r),
            border: borderColor != null ? Border.all(color: borderColor) : null,
          ),
          child: icon != null
              ? Icon(icon, size: 8.sp, color: Colors.white)
              : null,
        ),
        SizedBox(width: 4.w),
        AppText(
          label,
          style: context.typography.bodyExtraSmallRegular.copyWith(
            fontSize: 10.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildDeckTab(BuildContext context, String label, bool isSelected) {
    return Container(
      width: 30.w,
      height: 120.h,
      decoration: BoxDecoration(
        color: isSelected
            ? context.appColors.primary
            : context.appColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(context.shapeRadius.md),
      ),
      alignment: Alignment.center,
      child: RotatedBox(
        quarterTurns: 3,
        child: AppText(
          label,
          style: context.typography.bodySmallSemiBold,
          color: isSelected
              ? context.textColors.white
              : context.textColors.primary,
        ),
      ),
    );
  }

  Widget _buildSeatGrid(BuildContext context, bool isUpper) {
    if (isUpper) {
      // Mocking simplified Upper Deck structure
      return Column(
        children: [
          _buildRow(context, ["A1", "", "", "A1", "A2"]),
          _buildRow(
            context,
            ["B1", "", "", "A1", "A2"],
            overrides: {
              "B1": _SeatStatus.femaleReserved,
              "A2": _SeatStatus.maleReserved,
            },
          ),
          _buildRow(
            context,
            ["C1", "", "", "C1", "C1"],
            overrides: {"C1": _SeatStatus.maleReserved},
          ), // All C1s colored? Mocking logic
          _buildRow(context, ["D1", "", "", "D2", "D2"]),
          _buildRow(context, ["E1", "", "", "E1", "E1"]),
        ],
      );
    } else {
      // Mocking Lower Deck
      return Column(
        children: [
          _buildRow(
            context,
            ["A1", "", "", "A3", "A4"],
            overrides: {"A1": _SeatStatus.female},
          ),
          _buildRow(
            context,
            ["B1", "", "", "B1", "B2"],
            overrides: {
              "B1": _SeatStatus.femaleReserved,
              "B2": _SeatStatus.femaleReserved,
            },
          ),
          _buildRow(context, ["C1", "", "", "C3", "C4"]),
          _buildRow(
            context,
            ["D1", "", "", "D2", "D2"],
            overrides: {"D2": _SeatStatus.female},
          ),
          _buildRow(
            context,
            ["E1", "", "M", "E1", "E1"],
            overrides: {
              "E1": _SeatStatus.femaleReserved,
              "M": _SeatStatus.maleReserved,
            },
          ), // "M" for middle seat example
          _buildRow(
            context,
            ["F1", "", "", "F3", "F1"],
            overrides: {"F1": _SeatStatus.female},
          ),
        ],
      );
    }
  }

  Widget _buildRow(
    BuildContext context,
    List<String> seats, {
    Map<String, _SeatStatus>? overrides,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: seats.map((seatName) {
          if (seatName.isEmpty) return SizedBox(width: 40.w);

          _SeatStatus status = _SeatStatus.available;
          if (overrides != null && overrides.containsKey(seatName)) {
            status = overrides[seatName]!;
          }

          return _buildSeat(context, seatName, status);
        }).toList(),
      ),
    );
  }

  Widget _buildSeat(BuildContext context, String seatName, _SeatStatus status) {
    Color bgColor = context.backgroundColors.primary;
    Color textColor = context.textColors.primary;
    Color borderColor = context.strokeColors.primary.withOpacity(0.3);

    switch (status) {
      case _SeatStatus.available:
        break;
      case _SeatStatus.maleReserved:
        bgColor = context.appColors.secondary;
        textColor = context.textColors.white;
        borderColor = Colors.transparent;
        break;
      case _SeatStatus.femaleReserved: // Female Reserved (Sold/Booked?)
        bgColor = context.appColors.error; // Placeholder
        textColor = context.textColors.white;
        borderColor = Colors.transparent;
        break;
      case _SeatStatus.male: // Male Processing?
        bgColor = context.appColors.secondary; // Placeholder
        textColor = context.textColors.white;
        borderColor = Colors.transparent;
        break;
      case _SeatStatus.female: // Female Processing?
        bgColor = context.appColors.error.withOpacity(0.5); // Pinkish
        textColor = context.textColors.white;
        borderColor = Colors.transparent;
        break;
      default:
        break;
    }

    return Container(
      width: 40.w,
      height: 40.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: borderColor),
      ),
      child: AppText(
        seatName,
        style: context.typography.bodySmallSemiBold,
        color: textColor,
      ),
    );
  }
}

enum _SeatStatus {
  available,
  maleReserved,
  femaleReserved,
  male,
  female,
  sold,
  selected,
}

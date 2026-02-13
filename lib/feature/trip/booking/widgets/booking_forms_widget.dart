import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:playground_flutter_project/designsystem/dimensions/app_spacing.dart';
import 'package:playground_flutter_project/designsystem/extensions/theme_context_extension.dart';
import 'package:playground_flutter_project/ui/components/app_text.dart';
import 'package:playground_flutter_project/ui/components/spacer_box.dart';

class BookingFormsWidget extends StatelessWidget {
  const BookingFormsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacingSizes;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(context, "Seat Information"),
        SpacerBox(height: spacing.sm),
        _buildSeatInfoForm(context),
        SpacerBox(height: spacing.lg),
        _buildSectionHeader(context, "Passenger Information"),
        SpacerBox(height: spacing.sm),
        _buildPassengerInfoForm(context),
        SpacerBox(height: spacing.lg),
        _buildSectionHeader(context, "Booking Information"),
        SpacerBox(height: spacing.sm),
        _buildBookingInfoForm(context),
      ],
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return AppText(
      title,
      style: context.typography.bodyMediumSemiBold,
      color: context.textColors.navyBlue,
    );
  }

  Widget _buildSeatInfoForm(BuildContext context) {
    final spacing = context.spacingSizes;
    return Container(
      padding: AppSpacing.all(spacing.md),
      decoration: BoxDecoration(
        color: context.appColors.surface,
        borderRadius: BorderRadius.circular(context.shapeRadius.md),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: _buildInput(context, "Seat", "D1")),
              SpacerBox(width: spacing.md),
              Expanded(child: _buildInput(context, "Fare", "Tk...")),
            ],
          ),
          SpacerBox(height: spacing.md),
          Row(
            children: [
              Expanded(child: _buildInput(context, "Discount", "Tk...")),
              SpacerBox(width: spacing.md),
              Expanded(child: _buildInput(context, "Payable", "Tk...")),
            ],
          ),
          SpacerBox(height: spacing.md),
          Row(
            children: [
              Expanded(child: _buildInput(context, "Paid", "Tk...")),
              SpacerBox(width: spacing.md),
              Expanded(child: _buildInput(context, "Due", "Tk...")),
            ],
          ),
          SpacerBox(height: spacing.md),
          _buildDropdown(context, "Discount Reason"),
        ],
      ),
    );
  }

  Widget _buildPassengerInfoForm(BuildContext context) {
    final spacing = context.spacingSizes;
    return Container(
      padding: AppSpacing.all(spacing.md),
      decoration: BoxDecoration(
        color: context.appColors.surface,
        borderRadius: BorderRadius.circular(context.shapeRadius.md),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _buildRadio(context, "Male", true),
              SpacerBox(width: spacing.md),
              _buildRadio(context, "Female", false),
            ],
          ),
          SpacerBox(height: spacing.sm),
          _buildInput(
            context,
            "",
            "+880 1911633581",
            prefixIcon: Icons.flag,
            suffixIcon: Icons.call,
          ),
          SpacerBox(height: spacing.md),
          _buildInput(context, "", "Enter Passenger Name"),
          SpacerBox(height: spacing.md),
          _buildInput(context, "", "Enter NID/Passport Number"),
        ],
      ),
    );
  }

  Widget _buildBookingInfoForm(BuildContext context) {
    final spacing = context.spacingSizes;
    return Container(
      padding: AppSpacing.all(spacing.md),
      decoration: BoxDecoration(
        color: context.appColors.surface,
        borderRadius: BorderRadius.circular(context.shapeRadius.md),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _buildDropdown(context, "From Sub-City", "Dhaka"),
              ),
              SpacerBox(width: spacing.md),
              Expanded(child: _buildDropdown(context, "To Sub-City", "Mawa")),
            ],
          ),
          SpacerBox(height: spacing.md),
          Row(
            children: [
              Expanded(
                child: _buildDropdown(context, "Boarding", "Dhaka Counter"),
              ),
              SpacerBox(width: spacing.md),
              Expanded(
                child: _buildDropdown(context, "Dropping", "Passenger Name"),
              ),
            ],
          ),
          SpacerBox(height: spacing.md),
          _buildInput(
            context,
            "",
            "Dropping Note",
            prefixIcon: Icons.message_outlined,
          ),
        ],
      ),
    );
  }

  Widget _buildInput(
    BuildContext context,
    String label,
    String hint, {
    IconData? prefixIcon,
    IconData? suffixIcon,
  }) {
    final spacing = context.spacingSizes;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label.isNotEmpty) ...[
          AppText(
            label,
            style: context.typography.bodySmallRegular,
            color: context.textColors.secondary,
          ),
          SpacerBox(height: spacing.xs),
        ],
        Container(
          height: 40.h,
          padding: AppSpacing.symmetric(horizontal: spacing.sm),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(context.shapeRadius.lg),
            border: Border.all(
              color: context.strokeColors.primary.withOpacity(0.3),
            ),
          ),
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              if (prefixIcon != null) ...[
                Icon(
                  prefixIcon,
                  size: 16.sp,
                  color: context.textColors.secondary,
                ),
                SpacerBox(width: spacing.xs),
              ],
              Expanded(
                child: AppText(
                  hint,
                  style: context.typography.bodySmallRegular,
                  color: context.textColors.secondary,
                ),
              ),
              if (suffixIcon != null) ...[
                Icon(
                  suffixIcon,
                  size: 16.sp,
                  color: context.appColors.primary,
                ), // Greenish/WhatsApp color
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown(BuildContext context, String label, [String? value]) {
    final spacing = context.spacingSizes;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label.isNotEmpty && !label.contains("Reason")) ...[
          AppText(
            label,
            style: context.typography.bodySmallRegular,
            color: context.textColors.secondary,
          ),
          SpacerBox(height: spacing.xs),
        ],
        Container(
          height: 40.h,
          padding: AppSpacing.symmetric(horizontal: spacing.sm),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(context.shapeRadius.lg),
            border: Border.all(
              color: context.strokeColors.primary.withOpacity(0.3),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                value ?? label,
                style: context.typography.bodySmallRegular,
                color: value != null
                    ? context.textColors.primary
                    : context.textColors.secondary,
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

  Widget _buildRadio(BuildContext context, String label, bool isSelected) {
    return Row(
      children: [
        Icon(
          isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
          size: 16.sp,
          color: context.textColors.secondary,
        ),
        SizedBox(width: 4.w),
        AppText(label, style: context.typography.bodySmallRegular),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../riverpod/horizontal_list_calendar_riverpod.dart';

class HorizontalListCalendarHeader extends ConsumerWidget {
  final TextStyle headerTextStyle;
  final bool monthChangeButton;
  final double iconSize;
  final Icon? moveToPreviousMonthIcon;
  final Color moveToPreviousMonthIconBackgroundColor;
  final Color moveToPreviousMonthIconColor;
  final Icon? moveToNextMonthIcon;
  final Color moveToNextMonthIconBackgroundColor;
  final Color moveToNextMonthIconColor;

  const HorizontalListCalendarHeader({
    super.key,
    required this.headerTextStyle,
    this.monthChangeButton = true,
    required this.iconSize,
    this.moveToPreviousMonthIcon,
    this.moveToNextMonthIcon,
    required this.moveToNextMonthIconBackgroundColor,
    required this.moveToNextMonthIconColor,
    required this.moveToPreviousMonthIconBackgroundColor,
    required this.moveToPreviousMonthIconColor,
  });

  /// arrow button widget
  Widget _buildArrowButton({
    required VoidCallback onTap,
    required Color color,
    required IconData icon,
    required Color iconColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        child: Icon(icon, color: iconColor, size: iconSize),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final horizontalListCalendarState = ref.watch(
      horizontalListCalendarProvider,
    );
    final horizontalListCalendarNotifier = ref.watch(
      horizontalListCalendarProvider.notifier,
    );

    return Row(
      children: [
        Text(
          DateFormat(
            'MMMM yyyy',
          ).format(horizontalListCalendarState.currentDate!),
          style: headerTextStyle,
        ),

        Spacer(),

        if (monthChangeButton)
          moveToPreviousMonthIcon != null
              ? GestureDetector(
                onTap: () => horizontalListCalendarNotifier.changeMonth(-1),
                child: moveToPreviousMonthIcon,
              )
              : _buildArrowButton(
                onTap: () => horizontalListCalendarNotifier.changeMonth(-1),
                color: moveToPreviousMonthIconBackgroundColor,
                icon: Icons.arrow_back_ios_rounded,
                iconColor: moveToPreviousMonthIconColor,
              ),
        if (monthChangeButton) SizedBox(width: 12),

        if (monthChangeButton)
          moveToNextMonthIcon != null
              ? GestureDetector(
                onTap: () => horizontalListCalendarNotifier.changeMonth(1),
                child: moveToNextMonthIcon,
              )
              : _buildArrowButton(
                onTap: () => horizontalListCalendarNotifier.changeMonth(1),
                color: moveToNextMonthIconBackgroundColor,
                icon: Icons.arrow_forward_ios_outlined,
                iconColor: moveToNextMonthIconColor,
              ),
      ],
    );
  }
}

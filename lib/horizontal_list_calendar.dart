import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:horizontal_list_calendar/presentation/widgets/horizontal_list_calendar_body.dart';
import 'package:horizontal_list_calendar/presentation/widgets/horizontal_list_calendar_header.dart';

class HorizontalListCalendar extends StatelessWidget {
  /// Required properties

  /// onTap is a function that is called when a date is selected
  final Function(DateTime time) onTap;

  /// bodyPadding is the padding of the body of the calendar
  final EdgeInsets? bodyPadding;

  /// Color related properties
  final Color selectedDateBorderColor;
  final Color todayDateColor;
  final Color todayFillColor;

  /// Text related properties
  final TextStyle headerTextStyle;
  final TextStyle bodyTextStyle;

  /// Icon related properties
  final Icon? moveToPreviousMonthIcon;
  final Color? moveToPreviousMonthIconBackgroundColor;
  final Color? moveToPreviousMonthIconColor;
  final Icon? moveToNextMonthIcon;
  final Color? moveToNextMonthIconBackgroundColor;
  final Color? moveToNextMonthIconColor;

  const HorizontalListCalendar({
    super.key,
    required this.onTap,
    this.bodyPadding,
    this.selectedDateBorderColor = Colors.blue,
    this.todayDateColor = Colors.white,
    this.todayFillColor = Colors.blue,
    this.headerTextStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.grey,
    ),
    this.bodyTextStyle = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.blue,
    ),

    this.moveToPreviousMonthIcon,
    this.moveToNextMonthIcon,
    this.moveToNextMonthIconBackgroundColor,
    this.moveToNextMonthIconColor,
    this.moveToPreviousMonthIconBackgroundColor,
    this.moveToPreviousMonthIconColor,
  });

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Column(
        spacing: 24,
        children: [
          /// Header of the calendar
          HorizontalListCalendarHeader(
            textStyle: headerTextStyle,
            moveToPreviousMonthIcon: moveToPreviousMonthIcon,
            moveToNextMonthIcon: moveToNextMonthIcon,
            moveToNextMonthIconBackgroundColor:
                moveToNextMonthIconBackgroundColor,
            moveToNextMonthIconColor: moveToNextMonthIconColor,
          ),

          /// Body of the calendar
          SizedBox(
            height: 70,
            child: HorizontalListCalendarBody(
              onTap: onTap,
              textStyle: bodyTextStyle,
              selectedDateBorderColor: selectedDateBorderColor,
              todayDateColor: todayDateColor,
              todayFillColor: todayFillColor,
            ),
          ),
        ],
      ),
    );
  }
}

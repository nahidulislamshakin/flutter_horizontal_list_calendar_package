import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:horizontal_list_calendar/presentation/widgets/horizontal_list_calendar_body.dart';
import 'package:horizontal_list_calendar/presentation/widgets/horizontal_list_calendar_header.dart';

class HorizontalListCalendar extends StatelessWidget {
  /// Required properties

  /// onTap is a function that is called when a date is selected
  final Function(DateTime time) onTap;

  /// bodyPadding is the padding of the body of the calendar
  final EdgeInsets bodyPadding;
  final EdgeInsets headerPadding;

  /// Parameter for body
  ///
  /// all about selected
  final Color selectedColor;
  final Color selectedFillColor;
  final TextStyle selectedTextStyle;

  ///
  /// all about unselected
  final Color unSelectedFillColor;
  final TextStyle unSelectedTextStyle;

  /// all about today
  final Color todayFillColor;
  final TextStyle todayTextStyle;

  /// Parameter for Header
  ///
  /// Text related properties
  final TextStyle headerTextStyle;

  ///
  /// Icon related properties
  ///
  ///
  final Icon? moveToPreviousMonthIcon;
  final Color moveToPreviousMonthIconBackgroundColor;
  final Color moveToPreviousMonthIconColor;

  ///
  ///
  final Icon? moveToNextMonthIcon;
  final Color moveToNextMonthIconBackgroundColor;
  final Color moveToNextMonthIconColor;

  ///
  /// Icon Size parameter
  final double iconSize;

  /// Animation
  final Curve curve;
  final Duration duration;

  const HorizontalListCalendar({
    super.key,
    required this.onTap,
    this.bodyPadding = EdgeInsets.zero,
    this.headerPadding = EdgeInsets.zero,

    /// selected parameter
    this.selectedColor = Colors.blue,
    this.selectedFillColor = Colors.transparent,
    this.selectedTextStyle = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.blue,
    ),

    /// unselected parameter
    this.unSelectedFillColor = Colors.transparent,
    this.unSelectedTextStyle = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.blue,
    ),

    /// today parameter
    this.todayFillColor = Colors.blue,
    this.todayTextStyle = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),

    /// header parameter
    this.headerTextStyle = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.blue,
    ),

    /// icon parameter
    this.iconSize = 18,
    this.moveToPreviousMonthIcon,
    this.moveToPreviousMonthIconBackgroundColor = Colors.blue,
    this.moveToPreviousMonthIconColor = Colors.white,

    ///
    this.moveToNextMonthIcon,
    this.moveToNextMonthIconBackgroundColor = Colors.blue,
    this.moveToNextMonthIconColor = Colors.white,

    /// Animation
    this.curve = Curves.linear,
    this.duration = const Duration(milliseconds: 600),
  });

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Column(
        spacing: 24,
        children: [
          /// Header of the calendar
          Padding(
            padding: headerPadding,
            child: HorizontalListCalendarHeader(
              headerTextStyle: headerTextStyle,
              iconSize: iconSize,
              moveToPreviousMonthIcon: moveToPreviousMonthIcon,
              moveToPreviousMonthIconBackgroundColor:
                  moveToPreviousMonthIconBackgroundColor,
              moveToPreviousMonthIconColor: moveToPreviousMonthIconColor,
              moveToNextMonthIcon: moveToNextMonthIcon,
              moveToNextMonthIconBackgroundColor:
                  moveToNextMonthIconBackgroundColor,
              moveToNextMonthIconColor: moveToNextMonthIconColor,
            ),
          ),

          /// Body of the calendar
          SizedBox(
            height: 70,
            child: HorizontalListCalendarBody(
              onTap: onTap,
              bodyPadding: bodyPadding,
              selectedTextStyle: selectedTextStyle,
              selectedColor: selectedColor,
              selectedFillColor: selectedFillColor,
              unSelectedFillColor: unSelectedFillColor,
              unSelectedTextStyle: unSelectedTextStyle,
              todayTextStyle: todayTextStyle,
              todayFillColor: todayFillColor,
              curve: curve,
              duration: duration,
            ),
          ),
        ],
      ),
    );
  }
}

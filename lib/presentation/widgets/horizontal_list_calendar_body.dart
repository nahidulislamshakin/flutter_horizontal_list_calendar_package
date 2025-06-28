import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../riverpod/horizontal_list_calendar_riverpod.dart';

class HorizontalListCalendarBody extends ConsumerWidget {
  final Function(DateTime time) onTap;

  final bool canSelectDate;

  /// selected
  final Color selectedColor;
  final Color selectedFillColor;
  final TextStyle selectedTextStyle;

  /// all about unselected
  final Color unSelectedFillColor;
  final TextStyle unSelectedTextStyle;

  /// all about today
  final Color todayFillColor;
  final TextStyle todayTextStyle;

  /// Animation
  final Curve curve;
  final Duration duration;

  const HorizontalListCalendarBody({
    super.key,
    required this.onTap,
    this.canSelectDate = true,
    required this.selectedTextStyle,
    required this.selectedColor,
    required this.selectedFillColor,
    required this.unSelectedFillColor,
    required this.unSelectedTextStyle,
    required this.todayTextStyle,
    required this.todayFillColor,

    /// Animation
    required this.curve,
    required this.duration,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final horizontalListCalendarState = ref.watch(
      horizontalListCalendarRiverpodProvider,
    );
    final horizontalListCalendarNotifier = ref.watch(
      horizontalListCalendarRiverpodProvider.notifier,
    );

    /// Scroll to selected date
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => horizontalListCalendarNotifier.scrollToCurrentDate(
        duration: duration,
        curve: curve,
      ),
    );

    return ListView.builder(
      itemCount: horizontalListCalendarNotifier.daysInMonth.length,
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.zero,
      controller: horizontalListCalendarNotifier.calendarScrollController,
      itemBuilder: (_, index) {
        final date = horizontalListCalendarNotifier.daysInMonth[index];
        bool isToday =
            date.day == DateTime.now().day &&
            date.month == DateTime.now().month &&
            date.year == DateTime.now().year;
        bool isSelectedDay = date == horizontalListCalendarState.selectedDate;
        return GestureDetector(
          onTap:
              canSelectDate
                  ? () {
                    horizontalListCalendarNotifier.onSelectDate(
                      index: index,
                      onTap: onTap,
                    );
                  }
                  : () {},
          child: Container(
            width: 45,
            height: 68,
            margin: EdgeInsets.only(right: 10),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color:
                  isSelectedDay && !isToday
                      ? selectedFillColor
                      : isToday
                      ? todayFillColor
                      : unSelectedFillColor,
              border: Border.all(
                color: isSelectedDay ? selectedColor : Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(12),
            ),

            child: Column(
              children: [
                /// day of month
                Expanded(
                  child: Text(
                    date.day.toString(),
                    style:
                        isSelectedDay && !isToday
                            ? selectedTextStyle
                            : isToday
                            ? todayTextStyle
                            : unSelectedTextStyle,
                  ),
                ),

                SizedBox(height: 1),

                /// day of week
                Flexible(
                  child: Text(
                    DateFormat.E().format(date),

                    style:
                        isSelectedDay && !isToday
                            ? selectedTextStyle.copyWith(
                              fontSize: (selectedTextStyle.fontSize! - 1),
                            )
                            : isToday
                            ? todayTextStyle.copyWith(
                              fontSize: (todayTextStyle.fontSize! - 1),
                            )
                            : unSelectedTextStyle.copyWith(
                              fontSize: (unSelectedTextStyle.fontSize! - 1),
                            ),
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

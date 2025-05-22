import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../riverpod/horizontal_list_calendar_riverpod.dart';

class HorizontalListCalendarBody extends ConsumerWidget {
  final Function(DateTime time) onTap;
  final EdgeInsets? bodyPadding;

  final TextStyle textStyle;
  final Color selectedDateBorderColor;
  final Color todayDateColor;
  final Color todayFillColor;

   const HorizontalListCalendarBody({
     super.key,
     required this.onTap,
     this.bodyPadding,
     required this.textStyle,
     required this.selectedDateBorderColor,
     required this.todayDateColor,
     required this.todayFillColor,
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
    WidgetsBinding.instance.addPostFrameCallback((_) => horizontalListCalendarNotifier.scrollToCurrentDate());

    return ListView.builder(
      itemCount: horizontalListCalendarNotifier.daysInMonth.length,
      scrollDirection: Axis.horizontal,
      padding: bodyPadding ?? EdgeInsets.symmetric(horizontal: 10),
      controller: horizontalListCalendarNotifier.calendarScrollController,
      itemBuilder: (_, index) {
        final date = horizontalListCalendarNotifier.daysInMonth[index];
        bool isToday =
            date.day == DateTime.now().day &&
            date.month == DateTime.now().month &&
            date.year == DateTime.now().year;
        bool isSelectedDay = date == horizontalListCalendarState.selectedDate;
        return GestureDetector(
          onTap: () {
            horizontalListCalendarNotifier.onSelectDate(index: index, onTap: onTap);

          },
          child: Container(
            width: 47,
            height: 68,
            margin: EdgeInsets.only(right: 4),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color:
                  isToday
                      ? todayFillColor
                      : Colors.transparent,
              border: Border.all(
                color: isToday && isSelectedDay ? Colors.transparent : isSelectedDay ? selectedDateBorderColor : Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(12),
            ),

            child: Column(
              children: [
                /// day of month
                Text(
                  date.day.toString(),
                  style: textStyle.copyWith(
                    color:
                    isToday
                        ? todayDateColor
                        : null,
                  )
                ),

                SizedBox(height: 2),

                /// day of week
                Expanded(
                  child: Text(
                    DateFormat.E().format(date),

                    style: textStyle.copyWith(
                      color:
                      isToday
                          ? todayDateColor
                          : null,
                    )
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

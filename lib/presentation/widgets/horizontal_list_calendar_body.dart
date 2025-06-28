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

  final ScrollController scrollController;

  const HorizontalListCalendarBody({
    super.key,
    required this.scrollController,
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

  /// it will scroll to current date when the ListView build
  void scrollToCurrentDate(horizontalListCalendarState) {
    int currentIndex = horizontalListCalendarState.currentDate!.day - 1;
    double itemWidth = 55;

    /// Total scrollable width
    double screenWidth = scrollController.position.viewportDimension;

    /// Scroll to current date
    double scrollTo =
        (currentIndex * itemWidth) - (screenWidth / 2) + (itemWidth / 2);

    scrollController.animateTo(
      duration: duration,
      curve: curve,
      scrollTo.clamp(0, scrollController.position.maxScrollExtent),
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

    /// Scroll to selected date
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollToCurrentDate(horizontalListCalendarState);
    });

    return ListView.builder(
      itemCount: horizontalListCalendarNotifier.daysInMonth.length,
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.zero,
      controller: scrollController,
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

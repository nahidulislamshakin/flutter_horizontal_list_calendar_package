import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'horizontal_list_calendar_state.dart';

final horizontalListCalendarRiverpodProvider = StateNotifierProvider<
  HorizontalListCalendarRiverpod,
  HorizontalListCalendarState
>((ref) => HorizontalListCalendarRiverpod());

class HorizontalListCalendarRiverpod
    extends StateNotifier<HorizontalListCalendarState> {
  HorizontalListCalendarRiverpod() : super(HorizontalListCalendarState()) {
    setCurrentDate();
    //  WidgetsBinding.instance.addPostFrameCallback((_) => scrollToCurrentDate());
  }

  void setCurrentDate() {
    final currentDate = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    );
    state = state.copyWith(currentDate: currentDate, selectedDate: currentDate);
  }

  /// Scroll controller for calendar
  final ScrollController calendarScrollController = ScrollController();

  /// List of days in the current month
  List<DateTime> get daysInMonth => _getDaysInMonth(state.currentDate!);

  /// Get days in the current month
  List<DateTime> _getDaysInMonth(DateTime date) {
    int daysInMonth = DateTime(date.year, date.month + 1, 0).day;
    return List.generate(
      daysInMonth,
      (index) => DateTime(date.year, date.month, index + 1),
    );
  }

  /// Change month of the calendar
  void changeMonth(int increment) {
    DateTime currentDate = DateTime(
      state.currentDate!.year,
      state.currentDate!.month + increment,
      1,
    );
    if (currentDate.month == DateTime.now().month &&
        currentDate.year == DateTime.now().year) {
      currentDate = DateTime.now();
    }
    state = state.copyWith(currentDate: currentDate);
  }

  /// Scroll to current date
  void scrollToCurrentDate({required Duration duration, required Curve curve}) {
    int currentIndex = state.currentDate!.day - 1;
    double itemWidth = 55;

    /// Total scrollable width
    double screenWidth = calendarScrollController.position.viewportDimension;

    /// Scroll to current date
    double scrollTo =
        (currentIndex * itemWidth) - (screenWidth / 2) + (itemWidth / 2);
    calendarScrollController.animateTo(
      duration: duration,
      curve: curve,
      scrollTo.clamp(0, calendarScrollController.position.maxScrollExtent),
    );
  }

  /// on select a date
  void onSelectDate({required int index, required Function(DateTime) onTap}) {
    final selectedDate = DateTime(
      state.currentDate!.year,
      state.currentDate!.month,
      index + 1,
    );
    state = state.copyWith(
      selectedDate: selectedDate,
      currentDate: selectedDate,
    );
    onTap(state.selectedDate!);
  }
}

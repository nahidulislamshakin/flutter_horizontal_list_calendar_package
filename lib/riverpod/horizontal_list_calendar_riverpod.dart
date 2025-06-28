import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'horizontal_list_calendar_state.dart';

final horizontalListCalendarProvider = StateNotifierProvider<
  HorizontalListCalendarNotifier,
  HorizontalListCalendarState
>((ref) => HorizontalListCalendarNotifier());

class HorizontalListCalendarNotifier
    extends StateNotifier<HorizontalListCalendarState> {
  HorizontalListCalendarNotifier() : super(HorizontalListCalendarState()) {
    setCurrentDate();
  }

  // late ScrollController _scrollController;

  // void setScrollController(ScrollController scrollController){
  //   _scrollController = scrollController;
  //   setCurrentDate();
  // }
  /// ScrollController getter
  // ScrollController get scrollController => _scrollController;

  void setCurrentDate() {
    final currentDate = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    );
    state = state.copyWith(currentDate: currentDate, selectedDate: currentDate);
  }

  /// Scroll controller for calendar

  // void setScrollController(ScrollController scrollController) {
  //   state = state.copyWith(calendarScrollController: scrollController);
  //   setCurrentDate();
  // }

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

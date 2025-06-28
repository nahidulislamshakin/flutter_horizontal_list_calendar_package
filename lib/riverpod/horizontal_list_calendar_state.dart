class HorizontalListCalendarState {
  DateTime? selectedDate;
  DateTime? currentDate;
  //final ScrollController? calendarScrollController;

  HorizontalListCalendarState({
    this.selectedDate,
    this.currentDate,
    //this.calendarScrollController
  });

  HorizontalListCalendarState copyWith({
    DateTime? selectedDate,
    DateTime? currentDate,
    // ScrollController? calendarScrollController,
  }) {
    return HorizontalListCalendarState(
      selectedDate: selectedDate ?? this.selectedDate,
      currentDate: currentDate ?? this.currentDate,
      // calendarScrollController: calendarScrollController ?? this.calendarScrollController
    );
  }
}

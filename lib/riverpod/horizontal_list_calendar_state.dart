
class HorizontalListCalendarState {

  DateTime? selectedDate;
  DateTime? currentDate;

  HorizontalListCalendarState({this.selectedDate,  this.currentDate});

  HorizontalListCalendarState copyWith({DateTime? selectedDate, DateTime? currentDate}){
    return HorizontalListCalendarState(
      selectedDate: selectedDate ?? this.selectedDate,
      currentDate: currentDate ?? this.currentDate,
    );
  }
}
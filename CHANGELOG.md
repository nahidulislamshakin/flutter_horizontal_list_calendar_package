# Changelog

## [1.0.0] - 2025-06-28
### Fix Bug
- Fix the scroll controller bug.

## [0.1.0] - 2025-06-28

### Added
- Add canSelectDate, monthChangeButton parameter to control the calendar functionality

## [0.0.9] - 2025-05-26

### Added
- Created the `HorizontalListCalendar` widget for displaying a horizontally scrollable calendar.
- Integrated **Riverpod** for state management of the selected date.
- Added example usage and basic documentation.

### Changed
- Renamed 'selectedDateBorderColor' to 'selectedColor' for better clarity.

### Added New Parameters
- 'iconSize' for icon button
- 'curve' for scrolling animation curve
- 'duration' for scrolling animation duration
- 'selectedFillColor' for the selected date container fill color
- 'selectedTextStyle' for the selected date text style
- 'unSelectedFillColor' for the unselected date container fill color
- 'unSelectedTextStyle' for the unselected text style
- 'todayFillColor' for the today date Container fill color
- 'todayTextStyle' for the today text style
- 'headerTextStyle' for the header text style

### Removed
- 'bodyPadding' removed for centering the selected date


# Horizontal List Calendar

A customizable horizontal calendar widget for Flutter. The `HorizontalListCalendar` widget allows you to display a horizontal list of dates, with customizable colors, text styles, and interaction. It's perfect for use cases like date pickers or calendar navigation.

## Features

- Display dates in a horizontally scrolling list.
- Customizable selected and unselected date colors.
- Supports custom text styles.
- Easy to integrate with any Flutter app.
- Built-in support for **Riverpod** state management for date selection (optional, can be handled externally).

![Horizontal List Calendar Example](https://raw.githubusercontent.com/nahidulislamshakin/horizontal_list_calendar_image_and_gifs/main/image/horizontal_list_calendar.png)

## Parameters

Here’s a table listing all the parameters you can use with the `HorizontalListCalendar` widget:

| **Parameter**                            | **Type**             | **Description**                                               | **Default Value**                                                           |
|------------------------------------------|----------------------|---------------------------------------------------------------|-----------------------------------------------------------------------------|
| `onTap`                                  | `Function(DateTime)` | The callback function to handle date tap events. **Required** | N/A                                                                         |
| `headerPadding`                          | `EdgeInsets`         | Padding around the calendar header.                           | `EdgeInsets.zero`                                                           |
| **Selected Date Styling**                |                      |                                                               |                                                                             |
| `selectedColor`                          | `Color`              | The color of the selected date.                               | `Colors.blue`                                                               |
| `selectedFillColor`                      | `Color`              | Background fill color for the selected date.                  | `Colors.transparent`                                                        |
| `selectedTextStyle`                      | `TextStyle`          | Text style for the selected date.                             | `TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.blue)`  |
| **Unselected Date Styling**              |                      |                                                               |                                                                             |
| `unSelectedFillColor`                    | `Color`              | Background fill color for unselected dates.                   | `Colors.transparent`                                                        |
| `unSelectedTextStyle`                    | `TextStyle`          | Text style for unselected dates.                              | `TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.blue)`  |
| **Today's Date Styling**                 |                      |                                                               |                                                                             |
| `todayFillColor`                         | `Color`              | Background color for today's date.                            | `Colors.blue`                                                               |
| `todayTextStyle`                         | `TextStyle`          | Text style for today's date.                                  | `TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white)` |
| **Header Styling**                       |                      |                                                               |                                                                             |
| `headerTextStyle`                        | `TextStyle`          | Text style for the header.                                    | `TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.blue)`  |
| **Icon Styling**                         |                      |                                                               |                                                                             |
| `iconSize`                               | `double`             | Size of the navigation icons.                                 | `18`                                                                        |
| `moveToPreviousMonthIcon`                | `Icon?`              | Custom icon for moving to the previous month.                 | `null`                                                                      |
| `moveToPreviousMonthIconBackgroundColor` | `Color`              | Background color of the previous month icon.                  | `Colors.blue`                                                               |
| `moveToPreviousMonthIconColor`           | `Color`              | Color of the previous month icon.                             | `Colors.white`                                                              |
| `moveToNextMonthIcon`                    | `Icon?`              | Custom icon for moving to the next month.                     | `null`                                                                      |
| `moveToNextMonthIconBackgroundColor`     | `Color`              | Background color of the next month icon.                      | `Colors.blue`                                                               |
| `moveToNextMonthIconColor`               | `Color`              | Color of the next month icon.                                 | `Colors.white`                                                              |
| **Animation Parameters**                 |                      |                                                               |                                                                             |
| `curve`                                  | `Curve`              | The curve for the animation when switching months.            | `Curves.linear`                                                             |
| `duration`                               | `Duration`           | Duration of the animation when switching months.              | `const Duration(milliseconds: 600)`                                         |
| `canSelectDate,`                         | `bool`               | Can Select date turn on or off                                | `true`                                                                      |
| `monthChangeButton`                      | `bool`               | Can change month or fixed current month show                  | `true`                                                                      |

## Example Usage

Here’s an example of how to use the `HorizontalListCalendar` widget:

```dart
HorizontalListCalendar(
  onTap: (selectedDate) {
    // Handle date tap
    print('Selected Date: $selectedDate');
  },
  selectedColor: Colors.green,
  selectedFillColor: Colors.yellow,
  selectedTextStyle: TextStyle(color: Colors.red),
  iconSize: 24,
  moveToPreviousMonthIcon: Icon(Icons.arrow_back),
  moveToNextMonthIcon: Icon(Icons.arrow_forward),
  curve: Curves.easeInOut,
  duration: Duration(milliseconds: 500),
)
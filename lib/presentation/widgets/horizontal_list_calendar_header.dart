import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../riverpod/horizontal_list_calendar_riverpod.dart';

class HorizontalListCalendarHeader extends ConsumerWidget{
  final TextStyle textStyle;
  final Icon? moveToPreviousMonthIcon;
  final Color? moveToPreviousMonthIconBackgroundColor;
  final Color? moveToPreviousMonthIconColor;
  final Icon? moveToNextMonthIcon;
  final Color? moveToNextMonthIconBackgroundColor;
  final Color? moveToNextMonthIconColor;

   const HorizontalListCalendarHeader({
     super.key,
     required this.textStyle,
     this.moveToPreviousMonthIcon,
     this.moveToNextMonthIcon,
     this.moveToNextMonthIconBackgroundColor,
     this.moveToNextMonthIconColor,
     this.moveToPreviousMonthIconBackgroundColor,
     this.moveToPreviousMonthIconColor,
   });

  Widget _buildArrowButton({
    required VoidCallback onTap,
    required Color color, required IconData icon, required Color iconColor}){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: Icon(icon,color: iconColor,size: 14,),
      )
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final horizontalListCalendarState = ref.watch(horizontalListCalendarRiverpodProvider);
    final horizontalListCalendarNotifier = ref.watch(horizontalListCalendarRiverpodProvider.notifier);

    return Row(
      children: [
        Text(DateFormat('MMMM yyyy').format(horizontalListCalendarState.currentDate!),
        style: textStyle,
        ),

        Spacer(),


        moveToPreviousMonthIcon != null ?
            GestureDetector(
              onTap: ()=>horizontalListCalendarNotifier.changeMonth(-1),
              child: moveToPreviousMonthIcon,
            )
            :
        _buildArrowButton(
            onTap: ()=>horizontalListCalendarNotifier.changeMonth(-1),
            color: moveToPreviousMonthIconBackgroundColor ?? Color(0xff2B2C31),
            icon: Icons.arrow_back_ios_rounded,
            iconColor: moveToPreviousMonthIconColor ?? Color(0xffD2D2D5),
        ),
        SizedBox(width: 12,),

        moveToNextMonthIcon != null ?
        GestureDetector(
          onTap: ()=>horizontalListCalendarNotifier.changeMonth(1),
          child: moveToNextMonthIcon,
        )
            :

        _buildArrowButton(
            onTap: ()=>horizontalListCalendarNotifier.changeMonth(1),
            color: moveToPreviousMonthIconBackgroundColor ?? Color(0xff2B2C31),
            icon: Icons.arrow_forward_ios_outlined,
            iconColor: moveToPreviousMonthIconColor ?? Color(0xffD2D2D5),
        )
      ],
    );
  }
}
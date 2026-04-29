import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../widgets/custom_header.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomHeader(title: 'Calendario'),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: SfCalendar(
                  view: CalendarView.day,
                  firstDayOfWeek: 1,
                  showNavigationArrow: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:login_page_customized/env.dart' as env;

final Map<DateTime, List> _holidays = {
  DateTime(2019, 1, 1): ['New Year\'s Day'],
  DateTime(2019, 1, 6): ['Epiphany'],
  DateTime(2019, 2, 14): ['Valentine\'s Day'],
  DateTime(2019, 4, 21): ['Easter Sunday'],
  DateTime(2019, 4, 22): ['Easter Monday'],
};
const monthNames = [
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December"
];

class MyBottomSheet extends StatefulWidget {
  MyBottomSheet({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyBottomSheet>
    with TickerProviderStateMixin {
  DateTime _currentDate = DateTime(2019, 2, 3);
  DateTime _currentDate2 = DateTime(2019, 2, 3);

  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {},
  );

  CalendarCarousel _calendarCarousel;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _calendarCarousel = CalendarCarousel<Event>(
      pageScrollPhysics: ScrollPhysics(),
      weekDayBackgroundColor: Colors.black,
      weekDayPadding: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() => _currentDate = date);
        events.forEach((event) => print(event.title));
      },
      weekendTextStyle: TextStyle(
        color: Colors.red,
      ),
      thisMonthDayBorderColor: Colors.grey,
      onCalendarChanged: (DateTime date) {
        this.setState(() => _currentDate = date);
      },
      headerText: monthNames[_currentDate.month],
      headerTextStyle: env.mystyle,
      weekFormat: false,
      markedDatesMap: _markedDateMap,
      height: 400.0,
      showHeaderButton: true,
      onHeaderTitlePressed: (){},
      dayMainAxisAlignment: MainAxisAlignment.center,
      rightButtonIcon: Icon(Icons.arrow_forward_ios,color: Colors.black,),
      leftButtonIcon: Icon(Icons.arrow_back_ios,color: Colors.black,),
      selectedDateTime: _currentDate2,
      showIconBehindDayText: true,
      headerTitleTouchable: true,
      daysHaveCircularBorder: null,
      customGridViewPhysics: ScrollPhysics(),
      markedDateShowIcon: true,
      markedDateIconMaxShown: 2,
      selectedDayTextStyle: TextStyle(
        color: Colors.yellow,
      ),
      todayTextStyle: TextStyle(
        color: Colors.blue,
      ),
      markedDateIconBuilder: (event) {
        return event.icon;
      },
      minSelectedDate: _currentDate.subtract(Duration(days: 360)),
      maxSelectedDate: _currentDate.add(Duration(days: 360)),
      todayButtonColor: Colors.orange,
      todayBorderColor: Colors.red,
      markedDateMoreShowTotal: true,
    );

    return ListView(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          child: _calendarCarousel,
        ),
      ],
    );
  }
}

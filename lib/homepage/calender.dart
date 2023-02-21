
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:librarystore/homepage/repository.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:intl/intl.dart';

import 'package:http/http.dart'as http;

import 'calendermodel.dart';
class CustomAgenda extends StatefulWidget {
  const CustomAgenda({super.key});

  @override
  State<StatefulWidget> createState() => ScheduleExample();
}

class ScheduleExample extends State<CustomAgenda> {
  DateTime selecttime=DateTime.now();

  Repository repository=Repository();
  List<EventModelsdata> data=[];
 Future load()async{
   data=(await repository.geteventData())!;
  }
  final List<Appointment> _appointmentDetails = <Appointment>[];

   _DataSource? dataSource;

  @override
  void initState() {
    super.initState();
    load().then((value) {
      print("data length "+data.length.toString());
      dataSource = getCalendarDataSource();
    });

  }
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: SfCalendar(
                view: CalendarView.month,
                dataSource: dataSource,
                initialSelectedDate: DateTime.now().add(const Duration(days: -1)),
                onSelectionChanged: selectionChanged,
              ),
            ),
            Expanded(

              child: Row(
                children: [
                  Container(
                    child:CircleAvatar(
                      radius: 25,
                    child: Text(selecttime!.day.toString()),),
                  ),
                  Expanded(
                    child: Container(
                        color: Colors.black12,
                        child: ListView.separated(
                          padding: const EdgeInsets.all(2),
                          itemCount: _appointmentDetails.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                                padding: const EdgeInsets.all(2),
                                height: 60,
                                color: _appointmentDetails[index].color,
                                child: ListTile(
                                  leading: Column(
                                    children: <Widget>[
                                      Text(
                                        _appointmentDetails[index].isAllDay
                                            ? ''
                                            : DateFormat('hh:mm a').format(
                                            _appointmentDetails[index].startTime),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            height: 1.5),
                                      ),
                                      Text(
                                        _appointmentDetails[index].isAllDay
                                            ? 'All day'
                                            : '',
                                        style: const TextStyle(
                                            height: 0.5, color: Colors.white),
                                      ),
                                      Text(
                                        _appointmentDetails[index].isAllDay
                                            ? ''
                                            : DateFormat('hh:mm a').format(
                                            _appointmentDetails[index].endTime),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  trailing: Container(
                                      child: Icon(
                                        getIcon(_appointmentDetails[index].subject),
                                        size: 30,
                                        color: Colors.white,
                                      )),
                                  title: Container(
                                      child: Text(
                                          '${_appointmentDetails[index].subject}',
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white))),
                                ));
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                          const Divider(
                            height: 5,
                          ),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }

  void selectionChanged(CalendarSelectionDetails calendarSelectionDetails) {
    getSelectedDateAppointments(calendarSelectionDetails.date);
  }

  void getSelectedDateAppointments(DateTime? selectedDate) {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {
      setState(() {
        _appointmentDetails.clear();
      });
      if (dataSource!.appointments!.isEmpty) {
        return;
      }
      for (int i = 0; i < dataSource!.appointments!.length; i++) {
        Appointment appointment = dataSource!.appointments![i] as Appointment;
        /// It return the occurrence appointment for the given pattern appointment at the selected date.
        final Appointment? occurrenceAppointment = dataSource!.getOccurrenceAppointment(appointment, selectedDate!, '');

       print("seff${selectedDate}");
        if ((DateTime(appointment.startTime.year, appointment.startTime.month,
            appointment.startTime.day) == DateTime(selectedDate.year,selectedDate.month,
            selectedDate.day)) || occurrenceAppointment != null) {
          setState(() {
            selecttime=selectedDate;
            _appointmentDetails.add(appointment);

          });
        }
      }
    });
  }

  _DataSource getCalendarDataSource() {
    final List<Appointment> appointments = <Appointment>[];
     print("data show");

     // for(var i in data){
     //   print("ddddd${i["start"]}");
     // }

     // data.forEach((element)async {
     //   var response= await http.post(Uri.parse("https://soclose.co/api/event-list"),);
     //   var value=jsonDecode(response.body) as Map<String, dynamic>;
     //   print("ddddd${value["start"]}");
     //
     //   appointments.add(Appointment(
     //       startTime: DateTime.parse(element.start.toString()),
     //       endTime: DateTime.parse(element.end.toString()),
     //       subject: '${element.title}',
     //       color: Colors.red,
     //       recurrenceRule: 'FREQ=DAILY;INTERVAL=2;COUNT=10'
     //
     //   ));
     // });
    for (var i =0; i<data.length; i++){
      print("fayej");
      print("data range${data[i]}");
       print('${data[i].title}',);
      appointments.add(Appointment(
          startTime: DateTime.parse(data[i].start.toString()),
          endTime: DateTime.parse(data[i].end.toString()),
          subject: '${data[i].title}',
          color: Colors.red,
          recurrenceRule: 'FREQ=DAILY;INTERVAL=2;COUNT=10'
      ));

    }



    // appointments.add(Appointment(
    //     startTime: DateTime.now().add(const Duration(hours: 4, days: -1)),
    //     endTime: DateTime.now().add(const Duration(hours: 5, days: -1)),
    //     subject: 'Release Meeting',
    //     color: Colors.lightBlueAccent,
    //     isAllDay: true));

    // appointments.add(Appointment(
    //   startTime: DateTime.now(),
    //   endTime: DateTime.now().add(const Duration(hours: 1)),
    //   subject: 'Meeting',
    //   color: const Color(0xFFfb21f66),
    // ));
    // appointments.add(Appointment(
    //   startTime: DateTime.now().add(const Duration(days: -2, hours: 4)),
    //   endTime: DateTime.now().add(const Duration(days: -2, hours: 5)),
    //   subject: 'Development Meeting   New York, U.S.A',
    //   color: const Color(0xFFf527318),
    // ));
    // appointments.add(Appointment(
    //   startTime: DateTime.now().add(const Duration(days: -2, hours: 3)),
    //   endTime: DateTime.now().add(const Duration(days: -2, hours: 4)),
    //   subject: 'Project Plan Meeting   Kuala Lumpur, Malaysia',
    //   color: const Color(0xFFfb21f66),
    // ));
    // appointments.add(Appointment(
    //   startTime: DateTime.now().add(const Duration(days: -2, hours: 2)),
    //   endTime: DateTime.now().add(const Duration(days: -2, hours: 3)),
    //   subject: 'Support - Web Meeting   Dubai, UAE',
    //   color: const Color(0xFFf3282b8),
    // ));
    // appointments.add(Appointment(
    //   startTime: DateTime.now().add(const Duration(days: -2, hours: 1)),
    //   endTime: DateTime.now().add(const Duration(days: -2, hours: 2)),
    //   subject: 'Project Release Meeting   Istanbul, Turkey',
    //   color: const Color(0xFFf2a7886),
    // ));
    //
    // appointments.add(Appointment(
    //   startTime: DateTime.now().add(const Duration(hours: 2, days: -4)),
    //   endTime: DateTime.now().add(const Duration(hours: 4, days: -4)),
    //   subject: 'Performance check',
    //   color: Colors.amber,
    // ));
    // appointments.add(Appointment(
    //   startTime: DateTime.now().add(const Duration(hours: 11, days: -2)),
    //   endTime: DateTime.now().add(const Duration(hours: 12, days: -2)),
    //   subject: 'Customer Meeting   Tokyo, Japan',
    //   color: const Color(0xFFffb8d62),
    // ));
    // appointments.add(Appointment(
    //   startTime: DateTime.now().add(const Duration(hours: 6, days: 2)),
    //   endTime: DateTime.now().add(const Duration(hours: 7, days: 2)),
    //   subject: 'Retrospective',
    //   color: Colors.purple,
    // ));

    return _DataSource(appointments);



  }

  IconData getIcon(String subject) {
    if (subject == 'Planning') {
      return Icons.subject;
    } else if (subject == 'Development Meeting   New York, U.S.A') {
      return Icons.people;
    } else if (subject == 'Support - Web Meeting   Dubai, UAE') {
      return Icons.settings;
    } else if (subject == 'Project Plan Meeting   Kuala Lumpur, Malaysia') {
      return Icons.check_circle_outline;
    } else if (subject == 'Retrospective') {
      return Icons.people_outline;
    } else if (subject == 'Project Release Meeting   Istanbul, Turkey') {
      return Icons.people_outline;
    } else if (subject == 'Customer Meeting   Tokyo, Japan') {
      return Icons.settings_phone;
    } else if (subject == 'Release Meeting') {
      return Icons.view_day;
    } else {
      return Icons.beach_access;
    }
  }
}

class _DataSource extends CalendarDataSource {
  _DataSource(List<Appointment> source) {
    appointments = source;
  }
}
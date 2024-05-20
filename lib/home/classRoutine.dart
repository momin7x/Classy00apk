import 'package:classy/home/add_routine.dart';
import 'package:classy/const/all_colors.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_week_calendar/horizontal_week_calendar.dart';
import 'package:intl/intl.dart';

class Classroutine extends StatefulWidget {
  const Classroutine({super.key});

  @override
  State<Classroutine> createState() => _ClassroutineState();
}

class _ClassroutineState extends State<Classroutine> {
  var selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    // print(DateTime.now());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Routine()));
              },
              icon: Icon(Icons.add)),
        ],
        title: Text("Date"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25,right: 25),
        child: Column(
          children: [
            HorizontalWeekCalendar(
              weekStartFrom: WeekStartFrom.Sunday,
              activeBackgroundColor:const Color(0xff6573F5),
              activeTextColor: Colors.white,
              inactiveBackgroundColor:const Color(0xff6573F5).withOpacity(.3),
              inactiveTextColor: Colors.white,
              disabledTextColor: Colors.grey,
              disabledBackgroundColor: Colors.grey.withOpacity(.3),
              activeNavigatorColor: const Color(0xff6573F5),
              inactiveNavigatorColor: Colors.grey,
              monthColor:const Color(0xff6573F5),
              onDateChange: (date) {
                setState(() {
                  var selectedDate = date;
                });
              },
              borderRadius: BorderRadius.circular(5),
              showNavigationButtons: true,
              monthFormat: "MMMM yyyy",
              minDate: DateTime(2023, 12, 31),
              maxDate: DateTime(2025, 12, 31),
              initialDate: selectedDate,
              // initialDate: DateTime(2024, 4, 6),
            ),
            SizedBox(height: 15,),
           
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Time",
                      ),
                      const SizedBox(width: 60),
                      Text(
                        'Events',
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('1:00-2:30'),
                      SizedBox(width:10 ,),
                      Container(height: 80,width: 2,color: Colors.black,),
                      SizedBox(width:10 ,),
                      Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width/1.6,
                        
                        decoration: BoxDecoration(
                          color: AllColors.filledColor,
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12,right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.book,color: AllColors.whiteColor,size: 15,),
                                      Text('Digital Logic Design',style: TextStyle(fontSize: 14,fontWeight:FontWeight.w500,color: AllColors.whiteColor  ),),
                                    ],
                                  ),
                                   Row(
                                    children: [
                                      Icon(Icons.person,color: AllColors.whiteColor,size: 15),
                                      Text('D.M. Assdujjaman',style: TextStyle(color: AllColors.whiteColor  )),
                                    ],
                                  ),
                                   Row(
                                    children: [
                                      Icon(Icons.location_on,color: AllColors.whiteColor,size: 15),
                                      Text('Room- 412',style: TextStyle(color: AllColors.whiteColor  )),
                                    ],
                                  ),
                                ],
                              ),
                              IconButton(onPressed: (){}, icon: Icon(Icons.edit_note,color: AllColors.whiteColor,size: 25,))
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

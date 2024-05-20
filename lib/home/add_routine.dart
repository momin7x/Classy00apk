import 'package:classy/const/all_colors.dart';
import 'package:classy/widgets/text.dart';
import 'package:classy/widgets/textfield.dart';
import 'package:day_picker/day_picker.dart';
import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';

class Routine extends StatefulWidget {
  @override
  State<Routine> createState() => _RoutineState();
}

class _RoutineState extends State<Routine> {
  TextEditingController subjectController = TextEditingController();

  TextEditingController teacherNameController = TextEditingController();

  TextEditingController locationController = TextEditingController();

  // Initial Selected Value
  String dropdownvalue = 'Offline Class';

  // List of items in our dropdown menu
  var items = [
    'Offline Class',
    'Online Class',
    'Lab',
    'Practical',
    'Seminar',
    'Group Studay',
    'Exam',
    
  ];
 Duration _duration = Duration(hours: 0, minutes: 0);
 int? pickHour;
 int? pickMinute;

 var startTimeHour;
 var startTimeMinute;

  List<DayInWeek> _days = [
    DayInWeek(
      "Sun", dayKey: 'sunday',
    ),
    DayInWeek(
      "Mon", dayKey: 'monday',
    ),
    DayInWeek(
      "Tue",
      isSelected: true, dayKey: 'tuesday'
    ),
    DayInWeek(
      "Wed", dayKey: 'wednesday',
    ),
    DayInWeek(
      "Thu", dayKey: 'thusday',
    ),
    DayInWeek(
      "Fri", dayKey: 'friday',
    ),
    DayInWeek(
      "Sat", dayKey: 'saturday',
    )];
 bool repeat = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
    
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Save"),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff6573F5),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customText('Name of Subject'),
              customTextfield(subjectController,(val){
                
              }),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customText('Event Type'),
                  DropdownButton(
                    // Initial Value
                    value: dropdownvalue,
          
                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),
          
                    // Array list of items
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              customText('Teacher Name'),
              customTextfield(teacherNameController,(val){
                
              }),
              SizedBox(
                height: 10,
              ),
              customText('Location/Classroom'),
              customTextfield(locationController,(val){
                
              }),
              SizedBox(
                height: 10,
              ),
                 Column(
          
           children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween, 
               children: [
                 ElevatedButton(onPressed: ()async{
          var startTime = await showTimePicker(context: context, initialTime: TimeOfDay(hour: 8, minute: 30));
               // print(startTime);
               startTimeHour = startTime?.hour;
               startTimeMinute = startTime?.minute;
               setState(() {
                 
               });
                 }, child: Text('Start Time'),
                                style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff6573F5),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6))),),
                          startTimeHour==null||startTimeMinute==null?  Text('8 : 20 AM',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),): startTimeHour>12? Text('${startTimeHour-12} : $startTimeMinute PM',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600)):  Text('$startTimeHour : $startTimeMinute AM',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600)),
               ],
             ),
             Builder(
                builder: (BuildContext context) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                  children: [
                    ElevatedButton(
                          onPressed: () async {
                            var resultingDuration = await showDurationPicker(
                              context: context,
                              initialTime: Duration(minutes: 30),
                            );
                            pickHour = resultingDuration!.inHours ;
                            pickMinute = resultingDuration.inMinutes ;
                          setState(() {
                            
                          });
                          },
                          
                          child: Text('Set Duration'),
                            style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff6573F5),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6))),
                        ),
                      
                         pickHour ==null|| pickMinute==null?Text('0 H 0 Min',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),):  Text('$pickHour H ${pickMinute!-(pickHour!*60)}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600)),
                  ],
                )),
               SizedBox(height: 7,),
                SelectWeekDays(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              days: _days,
              border: false,
              boxDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AllColors.filledColor
              ),
              onSelect: (values) { // <== Callback to handle the selected days
                print(values);
              },
            ),
                 SizedBox(height: 7,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     ElevatedButton(
                                   onPressed: () {
                                    repeat = !repeat;
                                    setState(() {
                                      
                                    });
                                    print(repeat);
                                   },
                                   child: Row(
                      children: [
                        Text("Every Week"),
                        SizedBox(width: 5,),
                        Icon(Icons.event_repeat)
                      ],
                                   ),
                                   style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff6573F5),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                                 ),
                                repeat==false? Text('No',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 15),):Text('Yes',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 15))
                   ],
                 )
            //  Text(re)
           ],
                 )
              //  Expanded(
              //     child: DurationPicker(
              //   duration: _duration,
              //   onChange: (val) {
              //     setState(() => _duration = val);
              //   },
              //   snapToMins: 5.0,
              // ))
          
            ],
          ),
        ),
      ),
    );
  }
}

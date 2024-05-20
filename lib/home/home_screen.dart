

import 'package:classy/home/add_routine.dart';
import 'package:classy/home/classRoutine.dart';
import 'package:classy/notes.dart';
import 'package:classy/notes_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 String formattedDateEnglish = DateFormat.yMMMMEEEEd().format(DateTime.now());
 String formattedDateBangla = DateFormat('EEEE, d MMMM y','bn').format(DateTime.now());
 
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40,),
           
            ListTile(
              leading: CircleAvatar(
                  radius: 30,
                  child: Image.asset('assets/image/user.png',height: 35,width: 35,)),
              title:  const Text('User name',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
              subtitle:const Text('User Type',style: TextStyle(color: Colors.blue),) ,
              trailing: const SizedBox(
                width: 150,
                child: Row(
                  children: [
                      Icon(Icons.location_on),
                  Text('User Location',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),)
                          
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Text('Today',style: TextStyle(fontSize: 25,color: Colors.blue),),
              SizedBox(height: 10,),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 150,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: const Color(0xff6573F5),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child:  Padding(
                      padding:  EdgeInsets.only(left: 26),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Hijri date',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.white),),
                        Text(formattedDateEnglish,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.white),),
                         Text(formattedDateBangla,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.white),),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: -50,
                    right: -4,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 80,
                      child: Image.asset('assets/image/date.png',height: 150,)))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 180,
                    width: MediaQuery.of(context).size.width/2.4,
                   
                    decoration: BoxDecoration(
                     color: const Color(0xff6573F5),
                     borderRadius:BorderRadius.circular(15)
                     ),
        
                  ),
        
                    Container(
                    height: 180,
                    width: MediaQuery.of(context).size.width/2.4,
                   
                    decoration: BoxDecoration(
                     color: const Color(0xff6573F5),
                     borderRadius:BorderRadius.circular(15)
                     ),
        
                  ),
                ],
              ),
              SizedBox(
                height: 23,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> Classroutine())),
                    child: Container(
                          height: 80,
                          width: MediaQuery.of(context).size.width/2.4,
                         
                          decoration: BoxDecoration(
                           color: const Color(0xff6573F5),
                           borderRadius:BorderRadius.circular(15)
                           ),
                           child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                              Icon(Icons.timer,size: 30,color: Colors.white,),
                              SizedBox(width: 10,),
                               Text("Routine",style: TextStyle(color:Colors.white,fontSize:25  ),),
                             ],
                           ),
                    
                        ),
                  ),
                      InkWell(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> Notes())),
                        child: Container(
                          height: 80,
                          width: MediaQuery.of(context).size.width/2.4,
                         
                          decoration: BoxDecoration(
                           color: const Color(0xff6573F5),
                           borderRadius:BorderRadius.circular(15)
                           ),
                           child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                              Icon(Icons.note,size: 30,color: Colors.white,),
                              SizedBox(width: 10,),
                               Text("Notes",style: TextStyle(color:Colors.white,fontSize:25  ),),
                             ],
                           ),
                                        
                        ),
                      ),
                ],
        
                
              ),
              SizedBox(height:23),
              InkWell(
               
                child: Container(
                          height: 80,
                          width: MediaQuery.of(context).size.width/2.4,
                         
                          decoration: BoxDecoration(
                           color: const Color(0xff6573F5),
                           borderRadius:BorderRadius.circular(15)
                           ),
                           child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                              Icon(Icons.list,size: 30,color: Colors.white,),
                              SizedBox(width: 10,),
                               Text("To do",style: TextStyle(color:Colors.white,fontSize:25  ),),
                             ],
                           ),
                    
                        ),
              ),
        
                ],
              ),
            )
            
            
            
          ],
        ),
      ),
    );
  }
}
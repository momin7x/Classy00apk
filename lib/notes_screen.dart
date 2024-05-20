

import 'package:classy/notes.dart';
import 'package:flutter/material.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
      //  Navigator.push(context, MaterialPageRoute(builder: (context)=>));
      }),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Notes()));
              },
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  color: Color(0xff6573F5),
                  borderRadius: BorderRadius.circular(4)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Icon(Icons.note,color: Colors.white,),
                  SizedBox(width: 5,),
                  Text('Notes',style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold),)
                ],)
              ),
            )
          ],
        ),
      ),
    );
  }
}



import 'package:classy/const/all_colors.dart';
import 'package:classy/settings/change_password.dart';
import 'package:classy/settings/privacy.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Setting'),
        backgroundColor: AllColors.whiteColor,
        elevation: 5,
      ),
      body:Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          InkWell(
            onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangePassword()));
            },
            child: Card(child: ListTile(
              tileColor: AllColors.filledColor,
              title: Text("Chanage passward",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: AllColors.whiteColor),),)),
          ),
         InkWell(
          onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>PrivacyScreen()));
          },
           child: Card(child: ListTile(
              tileColor: AllColors.filledColor,
              title: Text("Privacy",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: AllColors.whiteColor),),)),
         ),
        ]
        
        ,),
      )
    );
  }
}
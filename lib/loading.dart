import 'package:classy/auth/loginPage.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Container(
          height: 200,
          width: 300,
          child: Image.asset("assets/logo.png")),
          const SizedBox(
            height: 60,),
          InkWell(
            onTap: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()))
            },
            child: Container(
              height:50,
              width: 150,
              
              decoration: BoxDecoration( color: Color(0xff6573F5),
                borderRadius: BorderRadius.circular(6)),
              child: Center(child: Text("Start",style: TextStyle(color: Colors.white,fontSize: 25),)),
            ),
          )
        ],),
      )),
    );
  }
}
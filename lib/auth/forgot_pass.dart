import 'package:classy/bottom_nav_controller.dart';
import 'package:classy/notes_screen.dart';
import 'package:flutter/material.dart';

class ForgotPassward extends StatelessWidget {
  const ForgotPassward({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(

        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Container(
          height: 200,
          width: 300,
          child: Image.asset("assets/logo.png")),
          const SizedBox(
            height: 20,),
             const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Email Address",
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      )),
                  TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'Enter your email',
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                      hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                      // labelStyle: TextStyle( color: Colors.white),
                      fillColor: const Color(0xff6573F5),
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff6573F5), width: 2)),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Align( alignment: Alignment.centerRight,
                    child: InkWell( 
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavController()));
                      },
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Color(0xff6573F5),
                            borderRadius: BorderRadius.circular(6)),
                        child: const Center(
                            child: Text(
                          "Send code",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        )),
                      ),
                    ),
                  ),
            
          ],
        ),
      ),
    );
  }
}
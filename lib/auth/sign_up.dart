
import 'dart:io';

import 'package:classy/auth/auth_controller.dart';
import 'package:classy/auth/loginPage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
   final RegExp emailvalid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController reInterPasswardController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final ImagePicker picker = ImagePicker();

   XFile? image;

  pickImagefromGallary()async{
    try {
      // Pick an image.
 image  = await picker.pickImage(source: ImageSource.gallery);
 setState(() {
   
 });
    } catch (e) {
      print(e.toString());
    }

  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
     // resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 200,
                      height: 100,
                      child: Image.asset("assets/logo.png"),
                    ),
                    const Text(
                      "Boost Your Study",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                     SizedBox(height: 10,),
                     ClipOval(
                    
                      child: image==null? IconButton(onPressed: (){
                        pickImagefromGallary();
                      }, icon: Icon(Icons.camera_alt,size: 40,)):
                      Image.file(File(image!.path),height: 100,width: 100,fit: BoxFit.cover,),
                     ),
                     const Align(
                      alignment: Alignment.topLeft,
                      child: Text("Name",style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        )),
                    TextFormField(
                      controller: nameController,
                         style: const TextStyle(color: Colors.white),
                         validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please fill up this field';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'Enter your full name',
                        prefixIcon: const Icon(
                          Icons.people,
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
                
                    const SizedBox(
                      height: 20,
                    ),
                    const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Email Address",
                          style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        )),
                    TextFormField(
                      controller: emailController,
                      style: const TextStyle(color: Colors.white),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please fill up this field';
                        }else if(emailvalid.hasMatch(emailController.text.trim())==false){
                          return 'enter your valid email';
                        }
                        return null;
                      },
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
                    const SizedBox(
                      height: 20,
                    ),
                    const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Mobile Number",
                          style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        )),
                    TextFormField(
                      controller: phoneNumberController,
                      style: const TextStyle(color: Colors.white),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please fill up this field';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'Enter your mobile number',
                        prefixIcon: const Icon(
                          Icons.mobile_friendly_rounded,
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
                    const SizedBox(
                      height: 20,
                    ),
                    const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Passward",
                          style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        )),
                    TextFormField(
                      controller: passwordController,
                      style: const TextStyle(color: Colors.white),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please fill up this field';
                        }else if(value.length<6){
                          return 'Password can not be less than 6 character';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'Enter your password',
                        prefixIcon: const Icon(
                          Icons.password,
                          color: Colors.white,
                        ),
                        suffixIcon: const Icon(
                          Icons.remove_red_eye,
                          color: Colors.white,
                        ),
                        hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                        // labelStyle: TextStyle( color: Colors.white),
                        fillColor: Color(0xff6573F5),
                        border:
                            const OutlineInputBorder(borderSide: BorderSide.none),
                        focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xff6573F5), width: 2)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                
                
                    const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Re-Enter Passward",
                          style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        )),
                    TextFormField(
                      controller: reInterPasswardController,
                      style: const TextStyle(color: Colors.white),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please fill up this field';
                        }else if(value.length<6){
                          return 'Password can not be less than 6 character';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'Enter your password',
                        prefixIcon: const Icon(
                          Icons.password,
                          color: Colors.white,
                        ),
                        suffixIcon: const Icon(
                          Icons.remove_red_eye,
                          color: Colors.white,
                        ),
                        hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                        // labelStyle: TextStyle( color: Colors.white),
                        fillColor: Color(0xff6573F5),
                        border:
                            const OutlineInputBorder(borderSide: BorderSide.none),
                        focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xff6573F5), width: 2)),
                      ),
                    ),
                    
                   
                    const SizedBox(
                      height: 50,
                    ),
                    InkWell(
                      onTap: () => {
                        if(_formKey.currentState!.validate() && image !=null){
                        AuthController().signUp(
                          emailController.text.trim(),passwordController.text.trim(),context,nameController.text.toString(),phoneNumberController.text.toString(),image!.path)
                        }
                     
                      },
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Color(0xff6573F5),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                            child: Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        )),
                      ),
                    ),
                    
                    const SizedBox(
                      height: 20,
                    ),
                    
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: "Already have an account?  ",
                            style:TextStyle(fontWeight: FontWeight.w500)
                          ),
                          TextSpan(
                            text: 'LogIn',
                            style: TextStyle(fontWeight:FontWeight.bold, color: Color(0xff6573F5),fontSize: 20 ),
                            recognizer: TapGestureRecognizer()..onTap=(){
                               Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                            }
                          )
                        ]
                      )
                    )
                  ],
                  
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

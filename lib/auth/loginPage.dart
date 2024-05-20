import 'package:classy/auth/auth_controller.dart';
import 'package:classy/auth/forgot_pass.dart';
import 'package:classy/bottom_nav_controller.dart';
import 'package:classy/auth/sign_up.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
 final _formKey = GlobalKey<FormState>();
  final RegExp emailvalid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                    const SizedBox(
                      height: 50,
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
                      height: 7,
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child:InkWell( 
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> ForgotPassward()));
                          },
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                                color: Color(0xff6573F5),
                                fontWeight: FontWeight.bold,fontSize: 20),
                          ),
                        )),
                    const SizedBox(
                      height: 50,
                    ),
                    InkWell(
                      onTap: () => {
                        if(_formKey.currentState!.validate()){
                        AuthController().signIn(
                          emailController.text.trim(),passwordController.text.trim(),context)
                        }
                     
                      },
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Color(0xff6573F5),
                            borderRadius: BorderRadius.circular(6)),
                        child: const Center(
                            child: Text(
                          "Log in",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        )),
                      ),
                    ),
                    SizedBox(height: 30,),
                    const Row(
                      children: [
                        Expanded(
                            child: Divider(
                          thickness: 3,
                        )),
                        Text('  or continue with  ',style: TextStyle(fontSize:18),),
                        Expanded(
                            child: Divider(
                          thickness: 3,
                        )),
                      ],
                    ),
                    SizedBox(height: 10,),
                   SizedBox(
                    width: 200,
                    child: OutlinedButton(onPressed: (){}, child: Image.asset("assets/google.png"))),
                    const SizedBox(
                      height: 20,
                    ),
                    
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: "Don't have an account?  ",
                            style:TextStyle(fontWeight: FontWeight.w500)
                          ),
                          TextSpan(
                            text: 'Sign Up',
                            style: const TextStyle(fontWeight:FontWeight.bold, color: Color(0xff6573F5),fontSize: 20 ),
                            recognizer: TapGestureRecognizer()..onTap=(){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
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


import 'package:classy/const/all_colors.dart';
import 'package:classy/widgets/textfield.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
 

  TextEditingController nameController = TextEditingController();
   TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // resizeToAvoidBottomInset: false,
      
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Profile'),
        backgroundColor: AllColors.whiteColor,
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
         // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.amberAccent,
                ),
                Positioned(
                  bottom: -5,right: 5,
                  child: IconButton(onPressed: (){}, icon: Icon(Icons.camera_alt
                )))
              ],
            ),
            Column(children: [
             SizedBox(height: 25,)
            ,customTextfield(nameController..text='Arshad Ziban',(val){

            }),
            SizedBox(height: 15,)
         
            ,customTextfield(emailController..text='test@gmail.com',(val){
              
            }),
            ],)
           
           
           // customTextfield(nameController,readonly: true)
          ],
        ),
      ),
    );
  }
}
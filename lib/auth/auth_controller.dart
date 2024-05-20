
import 'dart:io';

import 'package:classy/auth/loginPage.dart';
import 'package:classy/bottom_nav_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class AuthController{
  signUp(email,password,context,name,number,image)async{
    try {
  UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password
  );
  var userUid = userCredential.user!.uid;
  if(userUid.isNotEmpty){
    //convert image to file
  File imageFile = File(image);
  //set filename
  var time = DateTime.now().millisecond.toString();
  //upload to storage
 final uploadTask = FirebaseStorage.instance.ref('images').child('$time.png');
 
    TaskSnapshot snapshot = await uploadTask.putData(await imageFile.readAsBytes());
   //get image download link
 var imageUrl = await snapshot.ref.getDownloadURL();



  FirebaseFirestore.instance.collection('users').doc(userUid).set({
    'name' :name,
    'email':email,
    'password':password,
    'number': number,
    'uid': userUid.toString(),
    'image': imageUrl
  }).then((value) =>  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage())));
 
  }
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
} catch (e) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
}
  }

  signIn(email,password,context)async{
  try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password
  );
  if (credential.user!.uid.isNotEmpty) {
    FirebaseFirestore.instance.collection('users').doc(credential.user!.uid).get().
    then((DocumentSnapshot<Map<String,dynamic>> doc) {
      if (doc.exists) {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavController()));
      }
    });
    
  }
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
}catch(e){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
}
  }
}
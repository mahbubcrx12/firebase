import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/screen/home_page.dart';
import 'package:flutter/material.dart';

class FirebaseHelpers {
  signUp(email, password, context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      var authCredential = userCredential.user;

      if (authCredential!.uid.isNotEmpty) {
        Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
      } else {
        print("Sign Up Failed");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      print(e);
    } catch (e) {
      print(e);
    }
  }

  signIn(email, password, context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      var authCredential = userCredential.user;

      if (authCredential!.uid.isNotEmpty) {
        Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
      } else {
        print("Sign Up Failed");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      print(e);
    } catch (e) {
      print(e);
    }
  }
}

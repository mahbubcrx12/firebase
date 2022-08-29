import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection("users");
    Future<void> addUser() {
      return users.add({
        "first_name": _firstNameController.text,
        "last_name": _lastNameController.text,
        "phone": _phoneController.text,
        "age": _ageController.text,
        "address": _addressController.text,
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Register Here"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _firstNameController,
                decoration: InputDecoration(
                    hintText: "Enter First Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 12,
              ),
              TextField(
                controller: _lastNameController,
                decoration: InputDecoration(
                    hintText: "Enter Last Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 12,
              ),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                    hintText: "Enter Phone",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 12,
              ),
              TextField(
                controller: _ageController,
                decoration: InputDecoration(
                    hintText: "Age",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 12,
              ),
              TextField(
                maxLines: 5,
                controller: _addressController,
                decoration: InputDecoration(
                    hintText: "Address",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 12,
              ),
              ElevatedButton(
                  onPressed: () {
                    addUser();
                  },
                  child: Text("Register")),
            ],
          ),
        ),
      ),
    );
  }
}

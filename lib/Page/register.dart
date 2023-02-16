import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lab08/Page/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _tel = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('User');
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) {
                  GoogleSignIn().signOut();
                });
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Login(),
                    ));
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: SafeArea(
        child: Form(
          child: ListView(
            children: [
              Text("Name"),
              TextFormField(
                  controller: _name,
                  // keyboardType: TextInputType,
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return "Enter Name Please!";
                    }
                    return null;
                  })),
              Text("Tel"),
              TextFormField(
                  controller: _tel,
                  // keyboardType: TextInputType,
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return "Enter Telephone please!";
                    }
                    return null;
                  })),
              ElevatedButton(
                  onPressed: () {
                    print(FirebaseAuth.instance.currentUser);
                    final uid = FirebaseAuth.instance.currentUser!.uid;
                    users.doc(uid).set({
                      "fullname": _name.text,
                      "telephone": _tel.text,
                    });
                  },
                  child: Text("Save"))
            ],
          ),
        ),
      ),
    );
  }
}

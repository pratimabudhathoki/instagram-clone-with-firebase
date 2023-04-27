import 'package:flutter/material.dart';

class verifyCode extends StatefulWidget {
  final String verificationId;
  verifyCode({super.key, required this.verificationId});

  @override
  State<verifyCode> createState() => _verifyCodeState();
}

class _verifyCodeState extends State<verifyCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter your code"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, right: 10, left: 10),
            child: TextFormField(
              decoration: InputDecoration(hintText: "Enter your code"),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          SizedBox(
            width: 300,
            child: ElevatedButton(onPressed: () {}, child: Text("Login")),
          )
        ],
      ),
    );
  }
}

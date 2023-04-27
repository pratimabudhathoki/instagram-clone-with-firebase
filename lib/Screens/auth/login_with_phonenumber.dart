import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_insta_clone/Screens/auth/verify_code.dart';
import 'package:flutter_insta_clone/utils/utils.dart';
import 'package:country_picker/country_picker.dart';

class LoginWithPhonenumber extends StatefulWidget {
  const LoginWithPhonenumber({super.key});

  @override
  State<LoginWithPhonenumber> createState() => _LoginWithPhonenumberState();
}

class _LoginWithPhonenumberState extends State<LoginWithPhonenumber> {
  final PhoneNumberController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login with number"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
            child: TextFormField(
              keyboardType: TextInputType.phone,
              controller:
                  PhoneNumberController, //for getting auth of phone number
              decoration: InputDecoration(hintText: "Enter your Phone number"),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          ElevatedButton(
            onPressed: () {
              _auth.verifyPhoneNumber(
                  phoneNumber: PhoneNumberController.text,
                  verificationCompleted: (ram) {
                    print("Hamro code yaha gayo");
                  },
                  verificationFailed: (e) {
                    print("yaha error aayo hai $e");
                    utils().TostMessage(
                      e.toString(),
                    );
                  },
                  codeSent: (String verificationId, int? token) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              verifyCode(verificationId: verificationId),
                        ));
                  },
                  codeAutoRetrievalTimeout: (e) {
                    utils().TostMessage(e.toString());
                  });
            },
            child: SizedBox(
              width: 300,
              child: Center(
                child: Text("Login"),
              ),
            ),
          )
        ],
      ),
    );
  }
}

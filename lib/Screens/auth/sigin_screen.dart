import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_insta_clone/Screens/auth/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_insta_clone/main.dart';
import 'package:flutter_insta_clone/utils/utils.dart';

class SiginScreen extends StatefulWidget {
  const SiginScreen({super.key});

  @override
  State<SiginScreen> createState() => _SiginScreenState();
}

class _SiginScreenState extends State<SiginScreen> {
  bool loading = false;
  final _formkey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final usernamecontroller = TextEditingController();
  final numbercontroller = TextEditingController();
  // to create auth instance
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //release the data from memory
    emailcontroller.dispose();
    passwordcontroller.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Sigin Screen"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 50, bottom: 50, left: 10, right: 10),
        child: Column(
          children: [
            Form(
                key: _formkey,
                child: Expanded(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: usernamecontroller,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter username';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: " Username",
                          prefixIcon: Icon(Icons.person),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        //validating data while entering data in textfiled
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter your email';
                          }
                          return null;
                        },
                        controller: emailcontroller,
                        decoration: InputDecoration(
                          hintText: "Email",
                          prefixIcon: Icon(Icons.email),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter your Password';
                          }
                          return null;
                        },
                        obscureText: true,
                        controller: passwordcontroller,
                        decoration: InputDecoration(
                          hintText: " Password",
                          prefixIcon: Icon(Icons.lock_clock_outlined),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty || int.parse(value) < 10) {
                            return 'Enter your Number';
                            // } else if (int.parse(value) < 10) {
                            //   return 'The number must be ten';
                          }

                          return null;
                        },
                        keyboardType: TextInputType.number,
                        controller: numbercontroller,
                        decoration: InputDecoration(
                          hintText: "Phone",
                          prefixIcon: Icon(Icons.phone_android_rounded),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      loading == true
                          ? CircularProgressIndicator()
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    //making validation of data on on tap button
                                    if (_formkey.currentState!.validate()) {
                                      setState(() {
                                        loading = true;
                                      });
                                      await _auth
                                          .createUserWithEmailAndPassword(
                                              email: emailcontroller.text
                                                  .toString(),
                                              password: passwordcontroller.text
                                                  .toString())
                                          .then((value) {
                                        setState(() {
                                          loading = false;
                                          FirebaseFirestore.instance
                                              .collection("users")
                                              .doc(value.user?.uid)
                                              .set({
                                            "email": emailcontroller.text,
                                            "username": usernamecontroller.text,
                                            "phone": numbercontroller.text,
                                          });
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MyHomePage()));
                                        });
                                      }).onError((error, stackTrace) {
                                        setState(() {
                                          loading = false;
                                        });
                                        utils().TostMessage(error.toString());
                                      });
                                    }
                                  },
                                  child: Text(
                                    "Sign up",
                                    style: TextStyle(),
                                  ),
                                ),
                              ),
                            ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account"),
                            InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()),
                                  );
                                },
                                child: Text(
                                  " Login",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

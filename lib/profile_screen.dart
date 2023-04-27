import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_insta_clone/utils/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ImagePicker picker = ImagePicker(); //Declare the object for Image Picker
  XFile? image; //declare file To pick an image from Gallery
  final user = FirebaseAuth.instance.currentUser;

  var userName = '';
  var phone = '';
  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  void getUserInfo() async {
    var snapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get();
    var docData = snapshot.data();
    userName = docData!['username'];
    phone = docData['phone'];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          false, //for controlling overflow of image due to keyboard
      appBar: AppBar(
        elevation: 0,
        title: Text("Profile"),
        backgroundColor: Color.fromARGB(255, 219, 74, 74),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
              child: InkWell(
                onTap: () {
                  //bottom model come under the bottom
                  showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    context: context,
                    builder: (context) {
                      return Wrap(
                        children: [
                          InkWell(
                            onTap: () async {
                              // To pick an image from Gallery
                              image = await picker.pickImage(
                                  source: ImageSource.gallery);
                              setState(() {});
                            },
                            child: ListTile(
                              leading: Icon(Icons.photo),
                              title: Text("New Profile Picture"),
                            ),
                          ),
                          Divider(),
                          InkWell(
                            onTap: () async {
                              //to capture form camera
                              image = await picker.pickImage(
                                  source: ImageSource.camera);
                              setState(() {});
                            },
                            child: ListTile(
                              leading: Icon(Icons.camera),
                              title: Text("Take a  Photo"),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: image == null // applying condition
                      ? NetworkImage(
                          "https://i.pinimg.com/736x/7e/21/d4/7e21d4b03e83e91ed797a066eceea630.jpg")
                      //showind the image you had capture or taken form camera
                      : Image.file(File(image!.path)).image,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              onDoubleTap: () {
                showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  context: context,
                  builder: (context) {
                    return Wrap(
                      children: [
                        InkWell(
                          onTap: () async {
                            // To pick an image from Gallery
                            image = await picker.pickImage(
                                source: ImageSource.gallery);
                            setState(() {});
                          },
                          child: ListTile(
                            leading: Icon(Icons.photo),
                            title: Text("New Profile Picture"),
                          ),
                        ),
                        Divider(),
                        InkWell(
                          onTap: () async {
                            //to capture form camera
                            image = await picker.pickImage(
                                source: ImageSource.camera);
                            setState(() {});
                          },
                          child: ListTile(
                            leading: Icon(Icons.camera),
                            title: Text("Take a  Photo"),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Center(
                child: Text(
                  "Edit picture or change image",
                  style: TextStyle(
                      color: Colors.black.withOpacity(
                        0.6,
                      ),
                      fontSize: 15),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text("UserName"),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: TextField(
              controller: TextEditingController(text: userName),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 5),
            child: Text("Email"),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                controller: TextEditingController(
                    text: (user?.email ?? "user not found")),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 5),
            child: Text("Phone number"),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: TextField(
              controller: TextEditingController(text: phone),
            ),
          ),
        ],
      ),
    );
  }
}

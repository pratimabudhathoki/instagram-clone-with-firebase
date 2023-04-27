import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_insta_clone/chat_screens/messanger.dart';
import 'package:flutter_insta_clone/data/static_data.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  List<dynamic> users = []; //making the list to store the data
  Future<dynamic> getAlluser() async {
    //fetching the userdata form firestore
    final snapshot = await FirebaseFirestore.instance.collection("users").get();
    var documents = snapshot.docs;
    for (int i = 0; i < documents.length; i++) {
      // using the for loop
      users.add(documents[i].data()); // adding the doc to user list
    }
    setState(() {});
  }

  @override
  void initState() {
    // use to start the data
    super.initState();
    getAlluser(); // making function to fetch data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chats"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
            child: SizedBox(
              height: 47,
              child: TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    )),
              ),
            ),
          ),
          // Expanded(
          //     child: FirebaseAnimatedList(
          //   query: FirebaseDatabase.instance.ref("users"),
          //   itemBuilder: (context, snapshot, animation, index) {
          //     if (snapshot.exists) {
          //       return Text("Data loaded");
          //     }
          //     return Text("Data not loaded");
          //   },
          // ))

          ListView.builder(
            shrinkWrap: true,
            itemCount: users.length,
            itemBuilder: (context, index) {
              // return Text(users[index]['phone']);
              return ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Messangerscreen(),
                      ));
                },
                title: Text(users[index]['username']),
              );
            },
          )
        ],
      ),
    );
  }
}

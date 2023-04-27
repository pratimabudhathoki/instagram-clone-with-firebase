import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final referance = FirebaseDatabase.instance.ref("post");
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 219, 74, 74),
        title: Text("List Screen"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FirebaseAnimatedList(
              query: referance,
              itemBuilder: (context, snapshot, animation, index) {
                return ListTile(
                    title: Text(snapshot.child("title").value.toString()));
              },
            ),
          )
        ],
      ),
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_insta_clone/utils/utils.dart';

class AddpostScreen extends StatefulWidget {
  const AddpostScreen({super.key});

  @override
  State<AddpostScreen> createState() => _AddpostScreenState();
}

class _AddpostScreenState extends State<AddpostScreen> {
  final postcontroller =
      TextEditingController(); // for taking the data type by the user
  bool loading = false;
  final databaseref = FirebaseDatabase.instance.ref(
      'post'); //making the data ref and creating the instance called post which is node in firebase
  String id = DateTime.now().millisecondsSinceEpoch.toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Post"),
        backgroundColor: Color.fromARGB(255, 219, 74, 74),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextFormField(
              controller: postcontroller,
              maxLines: 4,
              maxLength: 100,
              decoration: InputDecoration(
                  hintText: "whats on your mind?",
                  border: OutlineInputBorder()),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 300,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Color.fromARGB(255, 219, 74, 74),
                ),
              ),
              onPressed: () {
                //making the child of node giving millisec to provide unique id
                databaseref.child(id).set({
                  'title': postcontroller.text
                      .toString(), // geeting data type by user
                  'id': (id)
                }).then((value) {
                  //to know the data is already store in firebase  then is used
                  utils().TostMessage('post added');
                }).onError((e, stackTrace) {
                  //  to know the error
                  utils().TostMessage(e.toString());
                });
              },
              child: Text("Add"),
            ),
          ),
        ],
      ),
    );
  }
}

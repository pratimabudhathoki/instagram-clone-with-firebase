import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_insta_clone/utils/utils.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<SearchScreen> {
  @override
  final referance = FirebaseDatabase.instance.ref("post");
  final _auth = FirebaseAuth.instance;
  final serchfilter = TextEditingController();
  final textcontroller = TextEditingController();

  Future<void> ShowMyDialog(String title, String id) async {
    textcontroller.text = title;
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Update"),
          content: Container(
            child: TextField(
              controller: textcontroller,
              decoration: InputDecoration(hintText: "Edit"),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                referance
                    .child(id)
                    .update({'title': textcontroller.text.toLowerCase()})
                    .then((value) => utils().TostMessage("post updated"))
                    .onError((error, stackTrace) =>
                        utils().TostMessage(error.toString()));
              },
              child: Text("Update"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
          ],
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Screen"),
        backgroundColor: Color.fromARGB(255, 219, 74, 74),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
            child: SizedBox(
              height: 47,
              child: TextFormField(
                controller: serchfilter,
                decoration: InputDecoration(
                  hintText: "Search",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onChanged: (String value) {
                  setState(() {});
                },
              ),
            ),
          ),
          Expanded(
            child: FirebaseAnimatedList(
              // list provided by the firebase
              query: referance,
              itemBuilder: (context, snapshot, animation, index) {
                final title = snapshot
                    .child("title")
                    .value
                    .toString(); // creating a variable for easy

                if (serchfilter.text.isEmpty) {
                  return ListTile(
                    title: Text(
                      snapshot.child("title").value.toString(),
                    ),
                    trailing: PopupMenuButton(
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: ListTile(
                            onTap: () {
                              Navigator.pop(context);
                              ShowMyDialog(
                                  title, snapshot.child('id').value.toString());
                            },
                            leading: Icon(Icons.edit),
                            title: Text("Edit"),
                          ),
                        ),
                        PopupMenuItem(
                          value: 1,
                          child: ListTile(
                            onTap: () {
                              referance
                                  .child(snapshot.child('id').value.toString())
                                  .remove();
                            },
                            leading: Icon(Icons.delete),
                            title: Text("Delate"),
                          ),
                        ),
                      ],
                      icon: Icon(Icons.more_vert),
                    ),
                  );
                } else if (title // comparing variable and above controller
                    .toLowerCase()
                    .contains(serchfilter.text.toLowerCase())) {
                  return ListTile(
                    title: Text(
                      snapshot.child("title").value.toString(),
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

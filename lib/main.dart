import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_insta_clone/Screens/Post_screen/add_screen.dart';
import 'package:flutter_insta_clone/Screens/Post_screen/list_screen.dart';
import 'package:flutter_insta_clone/profile_screen.dart';
import 'package:flutter_insta_clone/Screens/Post_screen/search_screen.dart';
import 'package:flutter_insta_clone/Screens/splashscreen.dart';

import 'Screens/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flutter',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePage(),
      bottomNavigationBar: BottomAppBar(
          child: Row(
        children: [
          Spacer(),
          IconButton(
            onPressed: () {
              setState(() {
                currentPage = 0;
              });
            },
            icon: Icon(
              Icons.home,
              color: currentPage == 0
                  ? Color.fromARGB(255, 219, 74, 74)
                  : Color.fromARGB(96, 49, 45, 45),
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(),
                  ));
              setState(() {
                currentPage = 1;
              });
            },
            icon: Icon(
              Icons.search,
              color: currentPage == 1
                  ? Color.fromARGB(255, 219, 74, 74)
                  : Color.fromARGB(96, 49, 45, 45),
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddpostScreen(),
                  ));
              setState(() {
                currentPage = 2;
              });
            },
            icon: Icon(
              Icons.add_outlined,
              color: currentPage == 2
                  ? Color.fromARGB(255, 219, 74, 74)
                  : Color.fromARGB(96, 49, 45, 45),
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListScreen(),
                  ));
              setState(() {
                currentPage = 3;
              });
            },
            icon: Icon(
              Icons.photo,
              color: currentPage == 3
                  ? Color.fromARGB(255, 219, 74, 74)
                  : Color.fromARGB(96, 49, 45, 45),
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(),
                  ));
              setState(() {
                currentPage = 4;
              });
            },
            icon: Icon(
              Icons.person,
              color: currentPage == 4
                  ? Color.fromARGB(255, 219, 74, 74)
                  : Color.fromARGB(96, 49, 45, 45),
            ),
          ),
          Spacer(),
        ],
      )),
    );
  }
}

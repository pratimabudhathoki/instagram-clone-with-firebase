import 'package:flutter/material.dart';
import 'package:flutter_insta_clone/data/static_data.dart';
import 'package:flutter_insta_clone/object.dart';
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePage> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Image.network(
          'https://www.pngitem.com/pimgs/m/132-1327993_instagram-logo-word-png-transparent-png.png',
          height: 50,
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                currentPage = 1;
              });
            },
            icon: Icon(
              Icons.favorite_border,
              color: currentPage == 1
                  ? Color.fromARGB(255, 219, 74, 74)
                  : Color.fromARGB(96, 49, 45, 45),
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                currentPage = 2;
              });
            },
            icon: Icon(
              Icons.chat_bubble_outline_outlined,
              color: currentPage == 2
                  ? Color.fromARGB(255, 219, 74, 74)
                  : Color.fromARGB(96, 49, 45, 45),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  users.length,
                  (index) => Container(
                    padding: EdgeInsets.all(3),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 39,
                          backgroundImage: NetworkImage(
                              'https://www.socialmediaexaminer.com/wp-content/uploads/2018/04/instagram-create-highlight-cover.png'),
                          child: CircleAvatar(
                            radius: 37,
                            backgroundImage:
                                NetworkImage(users[index].profileImage),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(users[index].name),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Divider(),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: posts.length,
              separatorBuilder: (context, index) => SizedBox(height: 10),
              itemBuilder: (context, index) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(6),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(
                                'https://www.socialmediaexaminer.com/wp-content/uploads/2018/04/instagram-create-highlight-cover.png'),
                            child: CircleAvatar(
                              radius: 18,
                              backgroundImage:
                                  NetworkImage(posts[index].user.profileImage),
                            ),
                          ),
                        ),
                        Text(posts[index].user.name),
                        Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.more_vert),
                        ),
                      ],
                    ),
                    Image(
                      width: double.maxFinite,
                      height: 350,
                      fit: BoxFit.cover,
                      image: NetworkImage(posts[index].images[0]),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.favorite_border),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.chat_bubble_outline_rounded),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.send),
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.bookmark_outline),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text("Liked by ${posts[index].like} people"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: Text(
                          "${posts[index].user.name} ${posts[index].caption}"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        "View all ${posts[index].comment} comments",
                        style: TextStyle(color: Colors.black.withOpacity(.4)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        "${posts[index].ago}",
                        style: TextStyle(color: Colors.black.withOpacity(.5)),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

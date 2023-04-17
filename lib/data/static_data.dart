import 'model/post_model.dart';
import 'model/user_model.dart';

List<UserModel> users = [
  UserModel(
    name: "willam",
    profileImage:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT14G_BNOVsEfP-sZdSD71M-pTpveY3O3xwxg&usqp=CAU",
  ),
  UserModel(
    name: "silly",
    profileImage:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9lW9Oyi3ojMKKXbknt-AZT3CU5soEbs86oXXc7juZO0aWUIXJk5kO92ohsE8LXHSe3j0&usqp=CAU",
  ),
  UserModel(
    name: "mariyan",
    profileImage:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQ_O6_ffLZ9ZN4yw6g2OJv5tT-aNzWQkvHaw&usqp=CAU",
  ),
  UserModel(
    name: "Amy",
    profileImage:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbEwxLE48W9CPk2qD_57w2h9gVMr51JUrY2A&usqp=CAU",
  ),
  UserModel(
    name: "sai",
    profileImage:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7wor-f5t_y_O-N3JPmS6UMuvtw6XXa4F-dA&usqp=CAU",
  ),
  UserModel(
    name: "brone",
    profileImage:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR474tEF9mkb8_ec-mjp_wB_k7GXLB8Rl6lBg&usqp=CAU",
  ),
  UserModel(
    name: "eddide",
    profileImage:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS43JbvzhtPs336a8BJ2dDXO4g7ZUW1Y9FQ5qexb4lS1spAZ2sv2r6rQOZQTCOo9ZARYvI&usqp=CAU",
  )
];

List<PostModel> posts = [
  PostModel(
    user: users[0],
    images: [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_v6idOr-em3hgQdM--zuLHKw0-m6S7UpeQQ&usqp=CAU",
    ],
    like: 500,
    comment: 80,
    caption: "heelo heart eye for you",
    ago: "24 hours ago",
  ),
  PostModel(
    user: users[3],
    images: [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTK3m16Sq3c4BAeN4X2TB1xTYw11R5ZFGyT1w&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTK3m16Sq3c4BAeN4X2TB1xTYw11R5ZFGyT1w&usqp=CAU",
    ],
    like: 10003,
    comment: 100,
    caption: " There is always  the hope",
    ago: "4 days ago",
  ),
  PostModel(
    user: users[5],
    images: [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyejc-bHUs_TgVbIObjBDe_xO-X38BRqH14g&usqp=CAU",
    ],
    like: 2499,
    comment: 68,
    caption: "keep on wild",
    ago: "2 days ago",
  ),
  PostModel(
    user: users[4],
    images: [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdIpGd8gLF3w0QWqkn6ub-FL0P5ln9ian7nA&usqp=CAU",
    ],
    like: 980,
    comment: 200,
    caption: "its the same thingss",
    ago: "4 days ago",
  ),
  PostModel(
    user: users[6],
    images: [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSX_DwC-oKEMdRP7pdI9S-cJqVwt-Q0DdV-jg&usqp=CAU",
    ],
    like: 230,
    comment: 130,
    caption: "coming to youuu",
    ago: "1 day ago",
  ),
  PostModel(
    user: users[4],
    images: [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdIpGd8gLF3w0QWqkn6ub-FL0P5ln9ian7nA&usqp=CAU",
    ],
    like: 2300,
    comment: 170,
    caption: "back in black",
    ago: "25 min ago",
  ),
  PostModel(
    user: users[1],
    images: [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQA-hzTHoxSfMccfRHKELJHMgoLhRMcp6CMqQ&usqp=CAU0",
    ],
    like: 930,
    comment: 400,
    caption: "ok bye",
    ago: "8 hours ago",
  ),
];

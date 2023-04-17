import 'package:flutter_insta_clone/data/model/user_model.dart';

class PostModel {
  final UserModel user;
  final List<String> images;
  final int like;
  final int comment;
  final String caption;
  final String ago;

  PostModel(
      {required this.user,
      required this.images,
      required this.like,
      required this.comment,
      required this.caption,
      required this.ago,});
}

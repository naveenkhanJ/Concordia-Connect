import 'package:flutter/material.dart';
import './models/Post_model.dart';
import 'feed_post_card.dart';
import './data/sample_data.dart';

class FeedList extends StatefulWidget {
  const FeedList({super.key});

  @override
  State<FeedList> createState() => _FeedListState();
}

class _FeedListState extends State<FeedList> {
  late List<PostModel> posts;

  @override
  void initState() {
    super.initState();
    posts = testPosts; // load sample data
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return FeedPostCard(
          post: post,
          onLike: (liked) {
            setState(() {
              post.isLiked = liked;
              post.likes += liked ? 1 : -1;
            });
          },
        );
      },
    );
  }
}

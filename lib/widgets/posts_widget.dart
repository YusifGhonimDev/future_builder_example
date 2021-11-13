import 'package:flutter/material.dart';
import 'package:future_builder_example/models/posts_model.dart';
import 'package:future_builder_example/screens/comments_screen.dart';

// ignore: must_be_immutable
class PostsWidget extends StatelessWidget {
  int index;
  PostsModel posts;

  PostsWidget(this.index, this.posts, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CommentsScreen(index)));
      },
      child: Card(
        child: Column(
          children: [
            buildListTile(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {},
                  child: buildIcons(Icons.thumb_up_alt_outlined, "Like"),
                ),
                TextButton(
                  onPressed: () {},
                  child: buildIcons(Icons.comment, "Comment"),
                ),
                TextButton(
                  onPressed: () {},
                  child: buildIcons(Icons.share, "Share"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIcons(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  Widget buildListTile() {
    return Column(
      children: [
        ListTile(
          leading: const CircleAvatar(
            backgroundImage: NetworkImage(
                "https://image.winudf.com/v2/image1/Y29tLmZpcmV3aGVlbC5ibGFja3NjcmVlbl9zY3JlZW5fMF8xNTgyNjgwMjgzXzA2MQ/screen-0.jpg?h=355&fakeurl=1&type=.jpg"),
          ),
          title: Row(
            children: [
              Expanded(
                child: Text(
                  posts.title!,
                ),
              ),
            ],
          ),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Column(
              children: [
                Text(
                  posts.body!,
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
          trailing: const Icon(Icons.more_vert_outlined),
        ),
        const Divider(),
      ],
    );
  }
}

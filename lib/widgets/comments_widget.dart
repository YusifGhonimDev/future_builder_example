import 'package:flutter/material.dart';
import 'package:future_builder_example/models/comments_model.dart';

// ignore: must_be_immutable
class CommentsWidget extends StatelessWidget {
  CommentsModel comments;

  CommentsWidget(this.comments, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const CircleAvatar(
          backgroundImage: NetworkImage(
              "https://image.winudf.com/v2/image1/Y29tLmZpcmV3aGVlbC5ibGFja3NjcmVlbl9zY3JlZW5fMF8xNTgyNjgwMjgzXzA2MQ/screen-0.jpg?h=355&fakeurl=1&type=.jpg"),
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                comments.name!,
              ),
            ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Column(
            children: [
              Text(
                comments.body!,
              ),
              const SizedBox(height: 15),
              Row(
                children: const [
                  Text("Like"),
                  SizedBox(width: 10),
                  Text(
                    "|",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(width: 10),
                  Text("Reply"),
                ],
              ),
            ],
          ),
        ),
        trailing: Text(
          comments.email!,
          style: const TextStyle(fontSize: 7),
        ),
      ),
    );
  }
}

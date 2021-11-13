import 'package:flutter/material.dart';
import 'package:future_builder_example/models/comments_model.dart';
import 'package:future_builder_example/services/network_helper.dart';
import 'package:future_builder_example/widgets/comments_widget.dart';

// ignore: must_be_immutable
class CommentsScreen extends StatefulWidget {
  int? index;
  // ignore: use_key_in_widget_constructors
  CommentsScreen([this.index]);

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  Future<List<dynamic>>? listOfComments;

  @override
  void initState() {
    listOfComments = NetworkHelper().getComments(postID: widget.index!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Comments"),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: listOfComments,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return CommentsWidget(
                  CommentsModel.fromJson(
                    snapshot.data![index],
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

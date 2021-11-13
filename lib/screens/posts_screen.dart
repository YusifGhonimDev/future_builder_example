import 'package:flutter/material.dart';
import 'package:future_builder_example/models/posts_model.dart';
import 'package:future_builder_example/services/network_helper.dart';
import 'package:future_builder_example/widgets/posts_widget.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  Future<List<dynamic>>? listOfPosts;

  @override
  void initState() {
    listOfPosts = NetworkHelper().getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: listOfPosts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return PostsWidget(
                  index,
                  PostsModel.fromJson(
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

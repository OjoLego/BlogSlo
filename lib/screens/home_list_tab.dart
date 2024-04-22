import 'package:flutter/material.dart';

import '../util/constants.dart';
import '../common/widgets/blog_post_tile.dart';

class HomeList extends StatelessWidget {
  const HomeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return const BlogPostTile(
          imageUrl: TImages.postImage,
          title: TTexts.creatingNewBlogPost,
          description: TTexts.thePurposeOfThisPost,
          date: 'April 12,2024',
          readTime: '4 min read',
        );
      },
    );
  }
}
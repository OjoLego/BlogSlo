import 'package:blog_slo/screens/create_post.dart';
import 'package:flutter/material.dart';

import '../util/constants.dart';
import '../common/widgets/blog_post_tile.dart';
import '../common/widgets/d_bold_text.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const DBoldText(
                heading: 'Your Post',
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                width: 180,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const CreatePost()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF093D9F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    'Create New Post',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 200,
                height: 40, // Adjust the width as needed
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Text('Filter: Recent'),
              Divider(),
            ],
          ),
          const SizedBox(height: 16.0),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return const BlogPostTile(
                  imageUrl: TImages.postImage,
                  title: TTexts.creatingNewBlogPost,
                  description: TTexts.thePurposeOfThisPost,
                  date: 'April 12, 2024',
                  readTime: '4 min read',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
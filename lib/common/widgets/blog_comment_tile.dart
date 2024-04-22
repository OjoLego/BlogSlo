import 'package:blog_slo/screens/home.dart';
import 'package:flutter/material.dart';
import '../../util/constants.dart';

class CommentCard extends StatelessWidget {
  final String username;
  final String comment;
  final IconData profileImage;
  final String timeAgo;
  final int likes;

  CommentCard({
    Key? key,
    required this.username,
    required this.comment,
    required this.profileImage,
    required this.timeAgo,
    required this.likes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const Home()),
              (route) => false,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 20.0,
                  backgroundImage: AssetImage(TImages.postImage),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      timeAgo,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(comment),
            Row(
              children: [
                const Icon(Icons.favorite_border),
                const SizedBox(width: 8),
                Text(likes.toString()),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                      'Reply',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

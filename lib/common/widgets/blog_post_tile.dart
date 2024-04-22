import 'package:flutter/material.dart';
import 'package:blog_slo/common/widgets/d_bold_text.dart';
import 'package:blog_slo/screens/blog_page.dart';
import 'package:blog_slo/util/constants.dart';

class BlogPostTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String date;
  final String readTime;

  const BlogPostTile({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.date,
    required this.readTime,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const BlogPage()),
              (route) => false,
        );
      },
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey,
              width: 1.0,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DBoldText(
                      heading: title,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(height: 8 / 2),
                    Text(
                      description,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          date,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Text(
                          readTime,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.more_horiz),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

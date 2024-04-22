import 'package:flutter/material.dart';
import 'package:blog_slo/common/widgets/blog_comment_tile.dart';
import 'package:blog_slo/common/widgets/d_brand_name.dart';
import 'package:blog_slo/util/constants.dart';
import '../common/widgets/d_bold_text.dart';
import '../common/widgets/d_sub_text.dart';
import 'home.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Home()),
        );
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const DBrandName(),
          actions: [
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Align(
                alignment: Alignment.center,
                child: DBoldText(
                  heading: 'Introduction to UI/UX',
                  fontSize: 26.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8.0),
              SizedBox(
                width: 0.9 * MediaQuery.of(context).size.width,
                child: const DSubText(
                  subHeading:
                  'A look into the tech career that has sent Nigeria into the tech space',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 20.0,
                    backgroundImage: AssetImage(TImages.postImage),
                  ),
                  SizedBox(width: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bisola Bisola',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Apr 12, 2024',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(width: 4.0),
                          Text(
                            '4 min read',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(),
              const SizedBox(height: 8.0),
              SizedBox(
                height: MediaQuery.of(context).size.height -
                    310.0, // Adjust height as needed
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        fit: BoxFit.fill,
                        TImages.fullBlogImage,
                        width: MediaQuery.of(context).size.width,
                        height: 200.0,
                      ),
                      const SizedBox(height: 8.0),
                      const Text(
                        TTexts.blogFullContent,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      const Divider(),
                      const Text(
                        'Comments',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      CommentCard(
                        username: 'Honey Combs',
                        comment:
                        'This was a very insightful post. As someone who is new to '
                            'the Design industry, it offers insight to basic expose in a '
                            'very soft way. Thank you ',
                        profileImage: Icons.account_circle,
                        timeAgo: '2 weeks ago',
                        likes: 0,
                      ),

                      const SizedBox(height: 16.0),

                      const Text(
                        'Explore more',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 16.0),

                      Image.asset(
                        fit: BoxFit.fill,
                        TImages.crayonImage,
                        width: MediaQuery.of(context).size.width,
                        height: 200.0,
                      ),

                      const SizedBox(height: 8.0),

                      const Text(
                        'Colours Scheme in Design',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 4.0),

                      const Text(
                        'A story of adventure with colours wheels and schemes',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

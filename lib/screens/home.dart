import 'package:blog_slo/common/widgets/blog_post_tile.dart';
import 'package:blog_slo/screens/post_screen_tab.dart';
import 'package:blog_slo/screens/testing.dart';
import 'package:flutter/material.dart';
import 'package:blog_slo/common/widgets/d_brand_name.dart';
import 'package:blog_slo/common/widgets/d_bold_text.dart';
import 'package:blog_slo/screens/login.dart';
import 'package:blog_slo/services/post_service.dart';
import 'package:blog_slo/util/constants.dart';
import 'home_list_tab.dart';
import '../models/post.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<dynamic>> futurePosts;
  // late Future<List<Post>> futurePosts;
  final bool _loading = false; // change to true later

  @override
  void initState() {
    super.initState();
    // futurePosts = fetchPosts();
    futurePosts = APICall().fetchApi();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Login()),
              (route) => false,
        );
        return true;
      },
      child: DefaultTabController(
        length: 4,
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
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20.0),
              const Align(
                alignment: Alignment.center,
                child: DBoldText(
                  heading: TTexts.blogSpace,
                  fontSize: 26.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20.0),
              const TabBar(
                tabs: [
                  Tab(text: TTexts.home),
                  Tab(text: TTexts.post),
                  Tab(text: TTexts.subscribers),
                  Tab(text: TTexts.statistics),
                ],
                labelStyle: TextStyle(
                  color: Color(0xFF4B5563),
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
                indicatorColor: Color(0xFF093D9F),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    _loading
                        ? const Center(child: CircularProgressIndicator())
                        : const HomeList(),
                    const PostScreen(),
                    Center(
                      child: FutureBuilder<List<dynamic>>(
                        future: futurePosts,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final List<dynamic> posts = snapshot.data!;
                            if (posts.isNotEmpty) {
                              return ListView.builder(
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  return BlogPostTile(
                                    imageUrl: TImages.postImage,
                                    title: '${posts[index]['title']}',
                                    description: '${posts[index]['description']}',
                                    date: 'April 12,2024',
                                    readTime: '4 min read',
                                  );
                                },
                              );
                            } else {
                              return const Text('No posts available');
                            }
                          } else if (snapshot.hasError) {
                            return Text('${snapshot.error}');
                          }
                          return const CircularProgressIndicator();
                        },
                      ),
                    ),
                    APICall(), //used a different api to test if my network call function is working
                    // const Center(child: Text('Content for Tab 4')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

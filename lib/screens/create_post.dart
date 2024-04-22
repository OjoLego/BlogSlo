import 'package:flutter/material.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Draft'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: SizedBox(
              width: 150,
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
                  'Publish',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children:  [
          Container(
            height: 150,
            color: Colors.grey[300],
            child: Center(
              child: Icon(
                Icons.camera_alt,
                size: 50,
                color: Colors.grey[600],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Title',
              hintStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Add a subtitle...',
              hintStyle: TextStyle(fontSize: 22, color: Colors.grey),
            ),
            style: TextStyle(fontSize: 22),
          ),
          const TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'The body of your post....',
            ),
            maxLines: null,
            keyboardType: TextInputType.multiline,
          ),
        ],
      ),
    );
  }
}

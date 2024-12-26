import 'package:aora_new/components/widgets/video.dart';
import 'package:aora_new/utils/theme.dart';
import 'package:flutter/material.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({super.key});

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  TextEditingController searchController = TextEditingController();

  final posts = [
    {
      'videoUrl': 'assets/images/video.png',
      'title': 'Man with vr glasses in futuristic city',
      'author': 'David Brown',
      'authorImageUrl': 'assets/images/avatar.png',
      'tags': ['vr', 'futuristic', 'city', 'gaming', 'glasses'],
    },
    {
      'videoUrl': 'assets/images/video2.png',
      'title': 'Futuristic virtual reality glasses for gaming',
      'author': 'Robert Taylor',
      'authorImageUrl': 'assets/images/avatar2.png',
      'tags': ['vr', 'futuristic', 'gaming', 'glasses'],
    },
  ];

  final response = [];

  final videos = [
    {
      'videoUrl': 'assets/images/girl.png',
      'title': 'Woman walks down a Tokyo...',
      'author': 'Brandon Etter',
    },
    {
      'videoUrl': 'assets/images/thumbnail.png',
      'title': 'Woman walks down a Tokyo...',
      'author': 'Brandon Etter',
      'authorImageUrl': 'assets/images/man.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 72.0),
      child: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Saved Videos',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextField(
                      onSubmitted: (String value) {},
                      controller: searchController,
                      style: TextStyle(
                        color: AppColors.accent,
                        fontWeight: FontWeight.w900,
                        fontSize: 16.0,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Search for your saved videos',
                        hintStyle: TextStyle(
                          color: AppColors.hint,
                        ),
                        suffixIcon: Icon(
                          Icons.search,
                          color: AppColors.accent,
                        ),
                        filled: true,
                        fillColor: AppColors.field,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 36.0),
                  ],
                ),
              ),
            ],
          ),
          for (final video in videos)
            Video(
              author: video['author']!,
              authorImageUrl: video['authorImageUrl'],
              title: video['title']!,
              videoUrl: video['videoUrl']!,
            ),
        ],
      ),
    );
  }
}

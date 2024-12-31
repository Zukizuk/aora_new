import 'package:aora_new/auth_notifier/auth_notifier.dart';
import 'package:aora_new/components/widgets/carousel_slider.dart';
import 'package:aora_new/components/widgets/video.dart';
import 'package:aora_new/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  TextEditingController searchController = TextEditingController();

  String username = '';

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

  void fetchVideos(String query) async {
    final res = await Future.delayed(Duration(seconds: 1), () {
      if (query.isEmpty) {
        return [];
      }
      return posts.where((post) {
        return post['tags'] != null && (post['tags'] as List).contains(query);
      }).toList();
    });

    setState(() {
      response.addAll(res);
    });
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    return Padding(
      padding: EdgeInsets.only(top: 72.0),
      child: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              response.isNotEmpty
                                  ? 'Search Results'
                                  : 'Welcome Back',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: AppColors.accent,
                              ),
                            ),
                            Text(
                              response.isNotEmpty
                                  ? searchController.text.trim()
                                  : authState.user?.name.toLowerCase() ?? "",
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        response.isNotEmpty
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    response.clear();
                                    searchController.clear();
                                  });
                                },
                                icon: Icon(
                                  Icons.close,
                                  color: AppColors.accent,
                                ),
                              )
                            : Image.asset(
                                'assets/images/logo-small.png',
                                width: 30.0,
                                height: 30.0,
                              ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    TextField(
                      onSubmitted: fetchVideos,
                      controller: searchController,
                      style: TextStyle(
                        color: AppColors.accent,
                        fontWeight: FontWeight.w900,
                        fontSize: 16.0,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Search for a video topic',
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
                    if (response.isEmpty)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Trending Videos',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w300,
                              color: AppColors.accent,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
          if (response.isEmpty) ...[
            const SizedBox(height: 16.0),
            MyCarouselSlider(),
            const SizedBox(height: 36.0),
          ],
          if (response.isEmpty)
            for (final video in videos)
              Video(
                author: video['author']!,
                authorImageUrl: video['authorImageUrl'],
                title: video['title']!,
                videoUrl: video['videoUrl']!,
              ),
          if (response.isNotEmpty)
            for (final post in response)
              Video(
                author: post['author']!,
                authorImageUrl: post['authorImageUrl'],
                title: post['title']!,
                videoUrl: post['videoUrl']!,
              )
        ],
      ),
    );
  }
}

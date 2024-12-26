import 'package:aora_new/utils/theme.dart';
import 'package:flutter/material.dart';

class Video extends StatelessWidget {
  final String videoUrl;
  final String title;
  final String author;
  final String? authorImageUrl;
  const Video(
      {super.key,
      required this.videoUrl,
      required this.title,
      required this.author,
      this.authorImageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 46.0,
                height: 46.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: AppColors.primary,
                    width: 2.0,
                  ),
                ),
                child: authorImageUrl == null
                    ? Center(
                        child: Text(
                          author[0].toUpperCase(),
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(
                          authorImageUrl ?? 'assets/images/user.png',
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
              SizedBox(width: 4.0),
              Expanded(
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          author,
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            color: AppColors.accent,
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: PopupMenuButton(
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            child: Text(
                              'Save',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          PopupMenuItem(
                            child: Text(
                              'Delete',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                        color: AppColors.menu,
                        icon: Icon(
                          Icons.more_vert,
                          color: AppColors.accent,
                          size: 23.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18.0),
          Container(
            margin: EdgeInsets.only(bottom: 30.0),
            width: double.infinity,
            height: 200.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage(videoUrl),
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}

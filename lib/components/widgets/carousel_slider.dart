import 'package:aora_new/utils/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyCarouselSlider extends StatefulWidget {
  final imagePaths = [
    'assets/images/train.png',
    'assets/images/dolphin.png',
    'assets/images/space.png',
  ];
  int activeIndex = 0;
  MyCarouselSlider({super.key});

  @override
  State<MyCarouselSlider> createState() => _MyCarouselSliderState();
}

class _MyCarouselSliderState extends State<MyCarouselSlider> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CarouselSlider.builder(
            itemCount: widget.imagePaths.length,
            options: CarouselOptions(
              height: 268.0,
              viewportFraction: 0.54,
              enableInfiniteScroll: false,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) =>
                  setState(() => widget.activeIndex = index),
            ),
            itemBuilder: (context, index, realIndex) {
              final imagePath = widget.imagePaths[index];
              return buildImage(imagePath, index);
            },
          ),
          SizedBox(height: 30.0),
          buildIndicator(),
        ],
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: widget.activeIndex,
        count: widget.imagePaths.length,
        effect: ExpandingDotsEffect(
          activeDotColor: AppColors.primary,
          dotColor: AppColors.accent,
          dotHeight: 7.0,
          dotWidth: 7.0,
          spacing: 8.0,
        ),
      );
}

Widget buildImage(String imagePath, int index) {
  return Container(
    width: 268.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      image: DecorationImage(
        image: AssetImage(imagePath),
        fit: BoxFit.cover,
      ),
    ),
  );
}

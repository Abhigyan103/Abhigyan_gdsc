import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ContentScreen extends StatelessWidget {
  const ContentScreen({
    super.key,
    required this.screenHeight,
    required this.lottieAsset,
    required this.titleText,
    required this.bodyText,
    required this.color,
  });
  final double screenHeight;
  final String lottieAsset;
  final String titleText;
  final String bodyText;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(
        titleText,
        style: TextStyle(
            fontFamily: 'Google Sans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color),
      ),
      expandedHeight: screenHeight * 1.5,
      flexibleSpace: FlexibleSpaceBar(
        background: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                bodyText,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontFamily: 'Google Sans',
                  fontWeight: FontWeight.w500,
                ),
              ),
              Lottie.asset(lottieAsset),
            ]),
          ),
        ),
        collapseMode: CollapseMode.parallax,
      ),
    );
  }
}

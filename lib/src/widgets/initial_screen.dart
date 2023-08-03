import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../constants/lottie_constants.dart';
import '../constants/text_constants.dart';

SliverAppBar initialScreen(double screenHeight) {
  return SliverAppBar(
    expandedHeight: screenHeight,
    flexibleSpace: FlexibleSpaceBar(
      background: Column(
        children: [
          Expanded(
            flex: 2,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(lottieGDSC),
                  const Text(
                    startupHeading,
                    style: TextStyle(
                        fontFamily: 'Google Sans', fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox.square(
                dimension: 60, child: Lottie.asset(lottieScrollDown)),
          )
        ],
      ),
      collapseMode: CollapseMode.parallax,
    ),
  );
}
